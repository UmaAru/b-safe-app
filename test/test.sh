#!/bin/bash

echo "======================================"
echo "B-Safe Automated Test Started"
echo "======================================"

echo ""
echo "Test 1: Checking index.html"

if [ -f "index.html" ]; then
    echo "PASS: index.html exists"
else
    echo "FAIL: index.html does not exist"
    exit 1
fi


echo ""
echo "Test 2: Checking application title"

if grep -q "B-Safe" index.html; then
    echo "PASS: B-Safe title found"
else
    echo "FAIL: B-Safe title not found"
    exit 1
fi


echo ""
echo "Test 3: Checking Dockerfile"

if [ -f "Dockerfile" ]; then
    echo "PASS: Dockerfile exists"
else
    echo "FAIL: Dockerfile does not exist"
    exit 1
fi


echo ""
echo "Test 4: Checking Nginx configuration"

if grep -q "nginx" Dockerfile; then
    echo "PASS: Nginx configuration found"
else
    echo "FAIL: Nginx configuration not found"
    exit 1
fi


echo ""
echo "Test 5: Checking port 80"

if grep -q "EXPOSE 80" Dockerfile; then
    echo "PASS: Port 80 exposed"
else
    echo "FAIL: Port 80 is not exposed"
    exit 1
fi


echo ""
echo "======================================"
echo "ALL TESTS PASSED"
echo "======================================"

exit 0
