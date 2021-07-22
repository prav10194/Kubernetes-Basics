rm -rf ./build && rm -rf ./dist && rm -rf ./docker_checks.egg-info

version_number=$(sed -n '/VERSION =/p' setup.py)
version_number=${version_number//\'/}
IFS=$'.'
version_number_array=($version_number)
updated_version_number=$((${version_number_array[2]} + 1))
sed -i '' "s/$(sed -n '/VERSION =/p' setup.py)/VERSION = '0.0.$updated_version_number'/g" setup.py

python setup.py sdist bdist_wheel
twine upload dist/*

# pip3 install docker-checks==0.0.$updated_version_number
# python3 test.py
