echo "hello tapan"
pwd

# Download and install Homebrew
if [ `command -v brew >/dev/null 2>&1` ]
then
  echo "Info   | Install   | homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
else
  echo 'Brew Already Installed.'
fi


# install jdk
if [ `command -v java >/dev/null 2>&1` ]
then
  echo "Info   | Install   | Java"
  brew install java
else
  echo 'Java Already Installed.'
fi


# install tomcat4
if [ $(sudo find / -type d -name apache-tomcat-7.0.72 | wc -l) -gt 0 ]
then
  echo "Apache tomcat already installed in you computer."
else
  [ -f "$HOME/apache-tomcat-7.0.72.zip" ] && rm -f $HOME/apache-tomcat-7.0.72.zip
  [ -d "$HOME/apache-tomcat-7.0.72" ] && rm -rf $HOME/apache-tomcat-7.0.72
  wget -P $HOME/ http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.zip
  unzip -o $HOME/apache-tomcat-7.0.72.zip -d $HOME/
  [ -d "$HOME/apache-tomcat-7.0.72" ] && chmod -R 777 $HOME/apache-tomcat-7.0.72 || echo "Unable to unzip the tomcat archive"
fi


# install gradle
if [ `command -v gradle >/dev/null 2>&1` ]
then
  echo "Info   | Install   | Gradle"
  brew install gradle
else
  echo 'Gradle Already Installed.'
fi


# do gradle tasks inside the project directory
# PWD=pwd
# cd $HOME
# if [ -d "es4j" ]
# then
#   echo "es4j directory already exists in your home directory."
#   git pull
# fi
# git clone https://github.com/yrashk/es4j/
# cd es4j
# git checkout indices-annotation-retention
# gradle jar
# gradle publishToMavenLocal
# gradle clean
# cd $PWD


# install intellij ultimate(paid) version with free 30 day trial
if [[ `ls /Applications | grep "IntelliJ IDEA.app"` ]]
then
  echo "IntelliJ IDEA is already installed on your computer."
else
  [ -f "$HOME/ideaIU-2016.2.5.dmg" ] && rm -f $HOME/ideaIU-2016.2.5.dmg
  wget -P $HOME/ https://download.jetbrains.com/idea/ideaIU-2016.2.5.dmg
  hdiutil mount $HOME/ideaIU-2016.2.5.dmg
  sudo cp -R "/Volumes/IntelliJ IDEA/IntelliJ IDEA.app" /Applications
fi
