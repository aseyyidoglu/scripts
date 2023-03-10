"""
Creates a deployable AWS python package in a ZIP archive
"""
echo Layer name:
read LAYER_NAME
echo Package names:
read PACKAGE_NAMES
PACKAGE_LIST=$(echo "$PACKAGE_NAMES" | sed 's/[[:blank:]]/, /g')

mkdir $LAYER_NAME
cd $LAYER_NAME
mkdir python
pip3 install --target ./python --platform manylinux2014_x86_64 --implementation cp --python 3.9 --only-binary=:all: --upgrade $PACKAGE_NAMES

touch ./lambda_function.py
cat > ./lambda_function.py << EOF
import $PACKAGE_LIST
def lambda_handler(event, context):   
  response = requests.get("https://www.example.com/")
  print(response.text)
  return response.text
EOF

zip -r ../$LAYER_NAME.zip .
rm -r ../$LAYER_NAME
