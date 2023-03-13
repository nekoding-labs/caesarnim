import strutils

proc encryptAsciiCaesar(s: string, key: int): string =
  var tmps: seq[char]

  for ch in s:
    let d = (int) ch
    let res = (d - key) mod 127
    tmps.add((char) res)

  return tmps.join("")

proc decryptAsciiCaesar(s: string, key: int): string =
  var tmps: seq[char]

  for ch in s:
    let d = (int) ch
    let res = (d + key) mod 127
    tmps.add((char) res)

  return tmps.join("")

proc encryptAlphaCaesar(s: string, key: int): string = 
  var tmps: seq[char]

  for ch in s.toUpper:
    let d = (int) ch
    if d == 32: 
      tmps.add(" ") # exclude space
    else:
      var res = (((d - key) - 65) mod 26) + 65
      if res < 65: res += 26
      
      tmps.add((char) res)
  
  return tmps.join("")

proc decryptAlphaCaesar(s: string, key: int): string = 
  var tmps: seq[char]

  for ch in s.toUpper:
    let d = (int) ch

    if d == 32: 
      tmps.add(" ") # exclude space
    else:
      var res = (((d + key) - 65) mod 26) + 65
      if res < 65: res += 26

      tmps.add((char) res)
  
  return tmps.join("")

when isMainModule:
  let plain = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"

  let encrypt = plain.encryptAsciiCaesar(5)
  let decrypt = encrypt.decryptAsciiCaesar(5)
  echo "encypt : "&encrypt
  echo "decrypt : "&decrypt

  let encrypt2 = plain.encryptAlphaCaesar(3)
  let decrypt2 = encrypt2.decryptAlphaCaesar(3)
  echo "encypt2 : "&encrypt2
  echo "decrypt2 : "&decrypt2