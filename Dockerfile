FROM python:3.12
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN python vastu_app/manage.py collectstatic --no-input
EXPOSE 8000
CMD ["gunicorn", "--chdir", "vastu_app", "--bind", "0.0.0.0:8000", "vastu_app.wsgi"]
