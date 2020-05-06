# Python Testing

Provides a platform for demonstrating basic algorithm design using test-driven development.

##  Usage

Install [Docker Desktop](https://docs.docker.com/install/overview/) and git.

Clone the repository:

```bash
git clone https://github.com/joshvillbrandt/python-testing.git
cd python-testing
```

Build the docker image:

```bash
make build
```

And finally run the tests:

```bash
make test
```

There are also `lint` and `shell` targets available in the makefile.

## Tips

Unit tests can be run with the `make test` command. Coverage and JunitXML outputs are automatically provided in the `.results` folder.

Single test methods can be executed by invoking the `pytest` command directly:

```bash
docker-compose run api pytest tests/file.py::function
```

or just like this if already in a shell:

```bash
pytest tests/file.py::function
```

For more information see the [pytest docs](https://docs.pytest.org/en/latest/usage.html).
