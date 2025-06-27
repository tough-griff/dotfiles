#!/bin/bash
set -eufo pipefail
op document get 3glsglf3o2iqrdbxzoe6hjxxnm | gpg --batch --import
op document get erkyqjbuzxptdvxwlkbyudkn3e | gpg --batch --import-ownertrust
