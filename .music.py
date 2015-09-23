import vk_api, time, os

def clean():
  os.system('echo "No music is playing" > .track; rm -f .cover.jpg')

def login():
  vk = vk_api.VkApi("login", "pass")
  try: vk.authorization()
  except vk_api.AuthorizationError as error_msg:
    print(error_msg)
    clean()
    exit()
  return vk

def load(vk):
  try:
    response = vk.method("status.get", {"user_id": 123456})
  except:
    return "", 0
  if "audio" in response:
    title = response["audio"]["artist"] + " - " + response["audio"]["title"]
    return title, response
  else:
    title = ""
    clean()
    return title, 0

def main():
  temp = ""
  clean()
  vk = login()
  while 1:
    title, response = load(vk)
    if temp != title and title != "":
      temp = title
      url  = response["audio"]["url"]
      url  = url[:url.find("?")]
      os.system('echo "' + title + '" > .track')
      os.system('rm -f .cover.jpg; ffmpeg -loglevel panic -i ' + \
        url + ' .cover.jpg; [ ! -f .cover.jpg ] && cp .blankcover.jpg .cover.jpg')
    time.sleep(1)

#   --= Run =--

main()