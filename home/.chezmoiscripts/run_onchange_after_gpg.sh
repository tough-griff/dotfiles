#!/bin/bash
set -eufo pipefail
op document get keut7m33ci3kiovpx3kjjydb4e | gpg --batch --import
op document get erkyqjbuzxptdvxwlkbyudkn3e | gpg --batch --import-ownertrust
