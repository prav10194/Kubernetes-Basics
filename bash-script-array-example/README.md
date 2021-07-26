## Bash basics

#### Making your script global

```cmd
cp <script_name>.sh /usr/local/bin/
cd <any_other_directory>
sh <script_name>.sh #to run the script from some other directory
```


#### Split functionality

```cmd
version_number='0.0.1'
IFS=$'.'
version_number_array=($version_number)
echo ${version_number_array[0]}
```

#### Find a string in file

```cmd
sed -n '/<PATTERN>/p' <FILE_NAME>
version_number=$(sed -n '/VERSION =/p' setup.py)
```

#### Find and replace a string in file

```cmd
sed -i '' "s/$(sed -n '/<PATTERN_OLD>/p' <FILE_NAME>)/<PATTERN_NEW>/g" <FILE_NAME>
sed -i '' "s/$(sed -n '/VERSION =/p' setup.py)/VERSION = '0.0.2'/g" setup.py
```
