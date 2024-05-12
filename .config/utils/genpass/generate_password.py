# ~/.config/utils/genpass/generate_password.py
import secrets
import string


def generate_password(length=12):
    alphabet = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(secrets.choice(alphabet) for _ in range(length))
    return password

# Example: Generate a 16-character password
password = generate_password(16)
print(password)
