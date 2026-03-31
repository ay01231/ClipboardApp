#!/bin/bash

set -e

swiftc Sources/*.swift \
-framework Cocoa \
-framework ApplicationServices \
-o clipboardapp