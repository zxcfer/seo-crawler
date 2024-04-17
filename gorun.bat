@echo off
python %PROJECT_HOME%\djangoapp\manage.py --version
if "%1" == "static" (
    python %PROJECT_HOME%\djangoapp\manage.py collectstatic --noinput
) else if "%1" == "make" (
    python %PROJECT_HOME%\djangoapp\manage.py makemigrations
) else if "%1" == "migrate" (
    python %PROJECT_HOME%\djangoapp\manage.py migrate
) else if "%1" == "pub" (
    python %PROJECT_HOME%\djangoapp\manage.py collectstatic --noinput
    git commit . -m "auto publish"
    git push origin master
) else (
    python %PROJECT_HOME%\djangoapp\manage.py runserver
)
