# %%
import os
import subprocess

import pandas as pd
import plotly.express as px

# %%
# Retrieve repo name
cwd = subprocess.check_output("pwd", shell=True)
repo_folder = cwd.decode("utf-8").strip().split("/")[-1]

# %%
# save git log history as one liners to local file
os.system(
    "git log --date=format:'%Y-%m-%d|%H:%M:%S' --format='%ad|%an|%s' > gitlog.txt"
)

# %%
# Parse the one-liners and categorise data
file = "gitlog.txt"
with open(file, "r") as f:
    df = pd.Series(f.readlines()).str.strip().str.split("|", expand=True).iloc[:-1]

# if commit msgs contain pipes '|' it causes a small issue - resolving here:
if len(df.columns) > 4:
    df.iloc[:, 3] = df.iloc[:, 3:].fillna("").agg(" ".join, axis=1)
    df = df.iloc[:, :4]

df.columns = ["date", "time", "commit_author", "commit_msg"]
df["commit_type"] = df.commit_msg.str.lower().str.extract("^\ ?([A-Za-z]{2,10}):")

df["hour"] = pd.to_datetime(df["time"]).dt.hour
df["date"] = pd.to_datetime(df["date"], yearfirst=True)
df["week"] = df["date"] - pd.TimedeltaIndex(df["date"].dt.day_of_week, unit="D")
df["daypart"] = df["time"].apply(
    lambda x: "Morning"
    if x >= "06:00:00" and x < "12:00:00"
    else "Afternoon"
    if x >= "12:00:00" and x < "17:00:00"
    else "Evening"
    if x >= "17:00:00" and x < "20:00:00"
    else "Late"
)
# %%
# Generate plotly charts

to_plot = df.groupby(["week", "commit_type"]).size().rename("# commits").reset_index()
fig = px.area(
    to_plot,
    x="week",
    y="# commits",
    facet_col="commit_type",
    facet_col_wrap=3,
    template="plotly_dark",
    title=f"{repo_folder}: GitLab Commits by type",
)
fig.for_each_annotation(lambda x: x.update(text=x.text.split("=")[-1]))
fig

# %%
tmp = df.copy()
commit_truncate_len = 80
tmp["author_msg"] = (
    tmp["commit_author"] + "|" + tmp["commit_msg"].str[:commit_truncate_len]
)
to_plot = pd.concat(
    [
        df.groupby(["week", "daypart"]).size().rename("# commits"),
        tmp.groupby(["week", "daypart"])
        .author_msg.agg("<br>".join)
        .rename("commit_list"),
    ],
    axis=1,
).reset_index()

sortkey = {"Morning": 0, "Afternoon": 1, "Evening": 2, "Late": 3}
fig2 = px.bar(
    to_plot.sort_values("daypart", key=lambda x: x.map(sortkey)),
    x="week",
    y="# commits",
    color="daypart",
    barmode="stack",
    template="plotly_dark",
    hover_data={"commit_list": True},
    title=f"{repo_folder}: GitLab Commits by time",
)
fig2
# %%
with open(f"gitlog_charts.html", "w") as f:
    f.write(fig.to_html(full_html=False, include_plotlyjs="cdn"))
    f.write(fig2.to_html(full_html=False, include_plotlyjs="cdn"))
# %%
# fig.to_image('git_log_commit_types.png')
# fig2.to_image('git_log_commit_times.png')
# %%
