#!/bin/sh
get_json_value()
{
  local json=$1
  local key=$2
  if [[ -z "$3" ]]; then
    local num=1
  else
    local num=$3
  fi
  local value=$(echo "${json}" | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'${key}'"/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p)
  echo ${value}
}

week=`date "+%w"`
data=`date "+%Y-%m-%d"`
time=`date "+%H:%M"`
ctimes=`date "+%s"`
wtimes=`cat /tmp/k3screenctrl/wtimes`
exptimes=`expr $wtimes + 120`

if [ $ctimes -gt $exptimes ]
then 
  curl "http://api.openweathermap.org/data/2.5/weather?zip=94305,us&units=metric&APPID=YOURKEY" > /tmp/k3screenctrl/weatherfile
  echo $ctimes > /tmp/k3screenctrl/wtimes
fi

weapi=`cat /tmp/k3screenctrl/weatherfile`
city=`get_json_value "$weapi" name`
temp=`get_json_value "$weapi" temp|awk '{printf("%.0f\n",$1)}'`
code=`get_json_value "$weapi" icon`
echo $city
echo $temp
echo $data
echo $time
echo $code
echo $week
echo 0
