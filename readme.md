# pip-tools + django-geojson bug

Reproduces https://github.com/jazzband/pip-tools/issues/2118

# Steps to reproduce

Run `make requirements`, or:  

```bash
python3 -m venv env
source env/bin/activate
pip install pip-tools
pip install --upgrade pip setuptools
pip-compile  --upgrade --resolver=backtracking --generate-hashes --allow-unsafe --output-file requirements.txt requirements.in
```

# Result

This fails with:

``` 
    × python setup.py egg_info did not run successfully.
    │ exit code: 1
    ╰─> [18 lines of output]
        /home/kees/Projects/example-pip-tools-django-geojson-bug/env/lib/python3.9/site-packages/setuptools/_distutils/dist.py:268: UserWarning: Unknown distribution option: 'test_suite'
          warnings.warn(msg)
        Traceback (most recent call last):
          File "<string>", line 2, in <module>
          File "<pip-setuptools-caller>", line 34, in <module>
          File "/tmp/pip-resolve-yb926m9s/geojson_325efcf3ad964dcd99772e98a044c1bf/setup.py", line 6, in <module>
            setup(name          = "geojson",
          File "/home/kees/Projects/example-pip-tools-django-geojson-bug/env/lib/python3.9/site-packages/setuptools/__init__.py", line 108, in setup
            return distutils.core.setup(**attrs)
          File "/home/kees/Projects/example-pip-tools-django-geojson-bug/env/lib/python3.9/site-packages/setuptools/_distutils/core.py", line 146, in setup
            _setup_distribution = dist = klass(attrs)
          File "/home/kees/Projects/example-pip-tools-django-geojson-bug/env/lib/python3.9/site-packages/setuptools/dist.py", line 289, in __init__
            self.metadata.version = self._normalize_version(self.metadata.version)
          File "/home/kees/Projects/example-pip-tools-django-geojson-bug/env/lib/python3.9/site-packages/setuptools/dist.py", line 325, in _normalize_version
            normalized = str(Version(version))
          File "/home/kees/Projects/example-pip-tools-django-geojson-bug/env/lib/python3.9/site-packages/packaging/version.py", line 200, in __init__
            match = self._regex.search(version)
        TypeError: cannot use a string pattern on a bytes-like object
        [end of output]
```
