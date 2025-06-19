#!/bin/bash
set -eufo pipefail
op document get 3glsglf3o2iqrdbxzoe6hjxxnm | gpg --import
op document get erkyqjbuzxptdvxwlkbyudkn3e | gpg --import-ownertrust
