@echo off

if not exist %delphiooLib%\ooBatch\ (
  @echo "Clonning ooBatch..."
  git clone https://github.com/VencejoSoftware/ooBatch.git %delphiooLib%\ooBatch\
  call %delphiooLib%\ooBatch\code\get_dependencies.bat
)

if not exist %delphiooLib%\ooGeneric\ (
  @echo "Clonning ooGeneric..."
  git clone https://github.com/VencejoSoftware/ooGeneric.git %delphiooLib%\ooGeneric\
  call %delphiooLib%\ooGeneric\code\get_dependencies.bat
)

if not exist %delphiooLib%\ooText\ (
  @echo "Clonning ooText..."
  git clone https://github.com/VencejoSoftware/ooText.git %delphiooLib%\ooText\
  call %delphiooLib%\ooText\code\get_dependencies.bat
)