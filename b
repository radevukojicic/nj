

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import time
import os
from selenium.webdriver.chrome.service import Service
import pymongo
from pymongo import MongoClient, InsertOne
import datetime
from datetime import date
import datetime as dt
from tkinter import *
# from webdriver_manager.chrome import ChromeDriverManager
 
chrome_options = Options()
chrome_options.add_argument('--headless')
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')

# driver = webdriver.Chrome("/usr/bin/chromedriver", options=chrome_options)

# link = os.path.dirname(__file__)
# driver = webdriver.Chrome(link+'/chromedriver')


# CHROMEDRIVER_PATH = "/app/.chromedriver/bin/chromedriver"

# chrome_bin = os.environ.get('GOOGLE_CHROME_BIN', "chromedriver")
# options = webdriver.ChromeOptions()
# options.binary_location = chrome_bin
# options.add_argument("--disable-gpu")
# options.add_argument("--no-sandbox")
# options.add_argument('headless')
# options.add_argument('window-size=1200x600')
# driver = webdriver.Chrome(executable_path=CHROMEDRIVER_PATH, chrome_options=options)

# chrome_options = webdriver.ChromeOptions()
# chrome_options.binary_location = os.environ.get("GOOGLE_CHROME_BIN")
# chrome_options.add_argument("--headless")
# chrome_options.add_argument("--disable-dev-shm-usage")
# chrome_options.add_argument("--no-sandbox")

# driver = webdriver.Chrome(executable_path=os.environ.get("CHROMEDRIVER_PATH"), options=chrome_options)
# driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))


myclient = pymongo.MongoClient("mongodb+srv://pilabs:piScript@cluster0.exo0x.mongodb.net/?retryWrites=true&w=majority")
mydb = myclient['prentis']
mycol = mydb["automobilis"]
Licitacija = mydb["licitacijas"]
kupi = mydb["kupiodmahs"]


# create gui window
Main_window = Tk()
 
# set the configuration
# of the window
Main_window.geometry("720x250")
 
# define a function
# for setting the new text

def test_file():


    driver = webdriver.Chrome("/usr/bin/chromedriver", options=chrome_options)
    
    #open the webpage
    driver.get("https://remktg.arval.com/buyer/#/login")

    button1 = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#onetrust-accept-btn-handler"))).click()

    #target username
    username = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='username']")))
    password = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='password']")))

    #enter username and password
    username.clear()
    username.send_keys("GUEST")
    password.clear()
    password.send_keys("Proba1234*1234")

    #target the login button and click it

    button = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[type='submit']"))).click()

    button3 = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.modal-footer .btn-primary'))).click()
    print("clicked")
    #We are logged in!

    #wait 5 seconds to allow your new page to load
    time.sleep(5)
    #open the webpage
    driver.get("https://remktg.arval.com/buyer/#/sales-events/")
    # driver.get("https://remktg.arval.com/buyer/#/login")

    # button1 = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#onetrust-accept-btn-handler"))).click()

    # #target username
    # username = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='username']")))
    # password = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='password']")))

    # #enter username and password
    # username.clear()
    # username.send_keys("GUEST")
    # password.clear()
    # password.send_keys("Proba1234*")

    # #target the login button and click it

    # button = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[type='submit']"))).click()

    # button3 = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.modal-footer .btn-primary'))).click()
    # print("Logged in")
    # #We are logged in!

#     #wait 5 seconds to allow your new page to load
    time.sleep(5)





    offers = driver.find_elements(By.CSS_SELECTOR, ".card-body .text-nowrap")
    offers = [a.text for a in offers]
    offers = [a for a in offers if str(a).startswith("Offer")]
    offers = [str(("sales-events/"+w[11:17])) for w in offers]

    print(offers[0])


    images = [] 

    #itterate over both uploaded and tagged images respectively
    for i in offers:

        # ************************************************
        # !! change goldie.may.750 to your own address !!
        # ************************************************
        driver.get("https://remktg.arval.com/buyer/#/" + i + "/")
        time.sleep(5)
    
        #scroll down
        #increase the range to sroll more
        #example: range(0,10) scrolls down 650+ images
        print("krece scrol")
        my_string_var.set("Pronalazenje auta..")
        Main_window.update()
        for j in range(0,22):
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(1)
        time.sleep(5)
        #target all the link elements on the page
        anchors = driver.find_elements(By.CLASS_NAME, "d-block")
        anchors = [a.get_attribute('href') for a in anchors]
        #narrow down all links to image links only
        anchors = [a for a in anchors if str(a).startswith("https://remktg.arval.com/buyer/#/item-details")]
    
        print('Found ' + str(len(anchors)) + ' links to images')
        
        my_string_var.set("Pronadjeno "+str(len(anchors))+" iz jedne liste")
        Main_window.update()
    
        #extract the [1]st image element in each link
        io = 0
        for a in anchors:
                try:
                    io=io+1
                    my_string_var.set("Ucitano "+str(io)+" od "+str(len(anchors)))
                    Main_window.update()
                    driver.get('https://remktg.arval.com/buyer/#/sales-events/204384')
                    time.sleep(1)
                    driver.get(a) #navigate to link
                    print("Otvoren link ",a)
                    time.sleep(8) #wait a bit
            
                    title = driver.find_elements(By.CSS_SELECTOR, "#submenu-main-characteristics")
                    startPrice =  driver.find_elements(By.CSS_SELECTOR, "#makeabid div .flex-column div div .font-weight-bold")
                    main = driver.find_elements(By.CSS_SELECTOR, ".text-secondary-darker")
                    main2 = driver.find_elements(By.CSS_SELECTOR, ".card-text .row .col-12 div span")
                    model = driver.find_elements(By.CSS_SELECTOR, ".card-text .mb-5 .col-12 div span")
                    badge = driver.find_elements(By.CSS_SELECTOR, ".badge-primary")
                    timer = driver.find_elements(By.CSS_SELECTOR, ".card-title div app-timer-display span")
                    maintenance = driver.find_elements(By.CSS_SELECTOR, "#submenu-maintenance-history div .card-text table tbody tr td")
                    oprema = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div.row.text-caption.line-height-normal.mb-5.ng-star-inserted  div span ")
                    
                    carList = driver.find_elements(By.CSS_SELECTOR, ".card-title .d-flex div")
                    imagesSlider = driver.find_elements(By.CSS_SELECTOR, "div.swiper-wrapper  div.swiper-slide.ng-star-inserted img")
                    
                    damageSlider = driver.find_elements(By.CSS_SELECTOR, ".swiper-container-damage div div img")
                    imagesSlider = [img.get_attribute('src') for img in imagesSlider]
                    imagesSlider = [a for a in imagesSlider if str(a).startswith("..//pictures")]

                    damageSlider = [img.get_attribute('src') for img in damageSlider]
                    power = driver.find_elements(By.CSS_SELECTOR, ".card-text .mb-5 .text-secondary-darker")


                    
                    ##new
                    modele2 = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(1)  span.text-secondary-darker.w-50")
                    godinaProiz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(2)  span.text-secondary-darker.w-50")
                    kubikaz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(1)  span.text-secondary-darker.w-50")
                    brojVrat = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(5)  span.text-secondary-darker.w-50")
                    brojBrz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(3)  span.text-secondary-darker.w-50")
                    x44New = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(4)  span.text-secondary-darker.w-50")
            


                    
            
                    print(len(oprema))

                    options_array = []
                    if(len(oprema) != 0):
                        for x in oprema:
                                options_array.append(x.text)


                    print(options_array)


                    print(len(startPrice))
                    print(len(maintenance))

                    maintenance_array = []
                    if(len(maintenance) != 0):
                        for x in maintenance:
                                maintenance_array.append(x.text)


                    print(maintenance_array)


                    pocetnaCena = 0
                    if(len(startPrice) != 0):
                        buggy_name = startPrice[0].text
                        pocetnaCena = buggy_name[:-4]
                        pocetnaCena = pocetnaCena.replace(",", "")
                        print(int(pocetnaCena))
                        pocetnaCena = int(pocetnaCena)
                        # print(startPrice[0].text)
            
                    #date
                    date = datetime.datetime.now()
                    print("Krece print")
                    print("PRINTANO \n \n \n \n")

                    badg = 0
                    if len(badge) != 0:
                        print("PROSO")
                        badg = int(badge[0].text)

                    options  = (badg * 2)+3
                    # print(options)

                    # print(
                    #     damageSlider[0],
            
                    # )
                    brojBrzina = '-'
                    x44 = '-'
                    marka = '-'
                    vrem = '00h 00mn'

                    if len(timer) != 0:
                        print("PROSO")
                        vrem = timer[0].text
                        
                    else:
                        timer = []
                        timer = ["-"]
                    
                    if len(carList) != 0:
                        print("PROSO")
                        carList[0] = carList[0].text
                    else:
                        carList = []
                        carList = ["-"]


                    if len(main) >= 38+options:
                        print("PROSO")
                        brojBrzina = main2[38+options].text

                    if len(main) >= 40+options:
                        print("PROSO")
                        x44 = main2[40+options].text

                    if len(main2) >= 2:
                        print("PROSO")
                        marka = main2[1].text

                    modele2Var = '-'
                    if len(modele2) > 0:
                        modele2Var = modele2[0].text
                    
                    brojBrzVar = '-'
                    if len(brojBrz) > 0:
                        brojBrzVar = brojBrz[0].text

                    brojVratVar = '-'
                    if len(brojVrat) > 0:
                        brojVratVar = brojVrat[0].text

                    kubikazVar = '-'
                    if len(kubikaz) > 0:
                        kubikazVar = kubikaz[0].text

                    godinaProizVar = '-'
                    if len(godinaProiz) > 0:
                        godinaProizVar = godinaProiz[0].text

                    x44NewVar = '-'
                    if len(x44New) > 0:
                        x44NewVar = x44New[0].text



                    myJsonFile = {}
                    


                    if(pocetnaCena!=0 and len(imagesSlider) > 0):

                                start = pocetnaCena
                                carina = (pocetnaCena+451)*0.05
                                pdv = (pocetnaCena+451)*0.21
                                before = pocetnaCena+carina+pdv+1321
                                final = 0

                                if(power[2].text == "Germany"):
                                    before = before+500
                                if(power[2].text == "Italy"): 
                                    before = before+300
                                if(power[2].text == "Spain"): 
                                    before = before+0
                                if(power[2].text == "Belgium"): 
                                    before = before+250
                                if(power[2].text == "Holland"): 
                                    before = before+300
                                if(power[2].text == "Czech"): 
                                    before = before+700
                                if(power[2].text == "Switzerland"): 
                                    before = before+400
                                if(power[2].text == "Luxembourg"): 
                                    before = before+250
                                
                                if(marka == "Peugeot"):
                                    before=before-carina
                                final = before+(before*0.10)

                                timerCh = str(vrem)
                                timerCh = timerCh.replace('d','')
                                timerCh = timerCh.replace('h','')
                                timerCh = timerCh.replace('mn','')
                                timerCh = timerCh.replace(' ','')

                                timerCh = int(timerCh)
                                
                                ##Taking files and sending to db
                                ##Taking files and sending to db
                                if(vrem == "00mn"):
                                        timerCh = 99999


                                myJsonFile = {"title":title[0].text ,
                                "list": "Offer","imgs": imagesSlider,
                                "kilometraza":power[0].text,"prvaReg":power[1].text,"zemlja":power[2].text,
                                "gorivo":power[3].text,"menjac":power[4].text,"sjedista":power[5].text, 
                                "marka":marka,
                                "registracija":main2[5].text,
                                "kljucevi":main2[9].text,
                                "emisija":main2[11].text,
                                "sjedista":power[5].text,
                                "timer":vrem,
                                "indBroj":main2[15].text,
                                    "snaga":main2[17].text,
                                    "boja":main2[19].text,
                                    "noxEmisija":main2[21].text,
                                    "model":modele2Var,
                                    "godinaProizvodnje":godinaProizVar,
                                    "brojVrata":brojVratVar,
                                    "arvalLink":a,
                                    "kubikaza":kubikazVar,
                                    "brojac":timerCh,
                                    "brojBrzina":brojBrzVar,
                                    "x44":x44NewVar,
                                    "startPrice":pocetnaCena,
                                    "final":int(final),
                                    "before":int(before),
                                    "odrzavanje":maintenance_array,
                                    "oprema":options_array,
                                    "createdAt":str(date)}
                                #if timer is active send else dont
                                if vrem != '':
                                    sendToDb = mycol.insert_one(myJsonFile)
                                    print("poslat")
                                    print(marka + " if")
                                    print(pocetnaCena )
                                else:
                                    print("nije poslat")
                        
                    else:
                        print("NO CLUE")
                except:
                    pass
                  


           

        #sending files to images array
            # images.append({"title":title[0].text , "list": carList[0].text,"imgs": carList[0].text }) #may change in future to img[?]

    print('I scraped '+ str(len(images)) + ' images!')
    time.sleep(1)
    print("Kraj funkcije")
    my_string_var.set("Aukcije zavrsene")
    Main_window.update()
    driver.close()






def otvorene_file():




    driver = webdriver.Chrome("/usr/bin/chromedriver", options=chrome_options)
    
    #open the webpage
    driver.get("https://remktg.arval.com/buyer/#/login")

    button1 = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#onetrust-accept-btn-handler"))).click()

    #target username
    username = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='username']")))
    password = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='password']")))

    #enter username and password
    username.clear()
    username.send_keys("GUEST")
    password.clear()
    password.send_keys("Proba1234*1234")

    #target the login button and click it

    button = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[type='submit']"))).click()

    button3 = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.modal-footer .btn-primary'))).click()
    print("clicked")
    #We are logged in!
    time.sleep(5)

    ##########################################
    #############################Auction start
    driver.get("https://remktg.arval.com/buyer/#/sales-events/")
    time.sleep(5)
    





    offers = driver.find_elements(By.CSS_SELECTOR, ".card-body .text-nowrap")
    offers = [a.text for a in offers]
    offers = [a for a in offers if str(a).startswith("Auction")]
    offers = [str(("sales-events/"+w[13:19])) for w in offers]

 
    
    images = [] 
    if(len(offers) == 0):
      offers = ["https://remktg.arval.com/buyer/#/sales-events/204384"]

    #itterate over both uploaded and tagged images respectively
    for i in offers:
        # ************************************************
        # !! change goldie.may.750 to your own address !!
        # ************************************************
        driver.get("https://remktg.arval.com/buyer/#/" + i + "/")
        time.sleep(5)
    
        #scroll down
        #increase the range to sroll more
        #example: range(0,10) scrolls down 650+ images
        print("krece scrol")
        my_string_var3.set("Pronalazenje auta..")
        Main_window.update()
        for j in range(0,22):
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(1)
        time.sleep(5)
        #target all the link elements on the page
        anchors = driver.find_elements(By.CLASS_NAME, "d-block")
        anchors = [a.get_attribute('href') for a in anchors]
        #narrow down all links to image links only
        anchors = [a for a in anchors if str(a).startswith("https://remktg.arval.com/buyer/#/item-details")]
    
        print('Found ' + str(len(anchors)) + ' links to images')
        my_string_var3.set("Pronadjeno "+str(len(anchors))+" iz jedne liste")
        Main_window.update()
    
        #extract the [1]st image element in each link
        io=0
        for a in anchors:
            try:
                  io=io+1
                  my_string_var3.set("Ucitano "+str(io)+" od "+str(len(anchors)))
                  Main_window.update()
                  driver.get('https://remktg.arval.com/buyer/#/sales-events/204384')
                  time.sleep(1)
                  driver.get(a) #navigate to link
                  print("Otvoren link ",a)
                  time.sleep(8) #wait a bit
            
                  title = driver.find_elements(By.CSS_SELECTOR, "#submenu-main-characteristics")
                  startPrice = driver.find_elements(By.CSS_SELECTOR, ".card-title div .d-flex .d-flex span")
                  main = driver.find_elements(By.CSS_SELECTOR, ".text-secondary-darker")
                  main2 = driver.find_elements(By.CSS_SELECTOR, ".card-text .row .col-12 div span")
                  model = driver.find_elements(By.CSS_SELECTOR, ".card-text .mb-5 .col-12 div span")
                  badge = driver.find_elements(By.CSS_SELECTOR, ".badge-primary")
                  timer = driver.find_elements(By.CSS_SELECTOR, ".card-title div app-timer-display span")
                  maintenance = driver.find_elements(By.CSS_SELECTOR, "#submenu-maintenance-history div .card-text table tbody tr td")
                  oprema = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div.row.text-caption.line-height-normal.mb-5.ng-star-inserted  div span ")
            
                  carList = driver.find_elements(By.CSS_SELECTOR, ".card-title .d-flex div")
                  imagesSlider = driver.find_elements(By.CSS_SELECTOR, "div.swiper-wrapper  div.swiper-slide.ng-star-inserted img")
            
                  damageSlider = driver.find_elements(By.CSS_SELECTOR, ".swiper-container-damage div div img")
                  imagesSlider = [img.get_attribute('src') for img in imagesSlider]

                  imagesSlider = [a for a in imagesSlider if str(a).startswith("..//pictures")]
                  

                  damageSlider = [img.get_attribute('src') for img in damageSlider]
                  power = driver.find_elements(By.CSS_SELECTOR, ".card-text .mb-5 .text-secondary-darker")


                  
                  ##new
                  modele2 = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(1)  span.text-secondary-darker.w-50")
                  godinaProiz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(2)  span.text-secondary-darker.w-50")
                  kubikaz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(1)  span.text-secondary-darker.w-50")
                  brojVrat = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(5)  span.text-secondary-darker.w-50")
                  brojBrz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(3)  span.text-secondary-darker.w-50")
                  x44New = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(4)  span.text-secondary-darker.w-50")
            
                  
                  print(len(oprema))

                  options_array = []
                  if(len(oprema) != 0):
                         for x in oprema:
                                options_array.append(x.text)


                  print(options_array)

                  print(len(startPrice))
                  maintenance_array = []
                  if(len(maintenance) != 0):
                         for x in maintenance:
                                maintenance_array.append(x.text)


                  print(maintenance_array)
                  pocetnaCena = 0
                  if(len(startPrice) != 0):
                        buggy_name = startPrice[0].text
                        pocetnaCena = buggy_name[:-4]
                        pocetnaCena = pocetnaCena.replace(",", "")
                        pocetnaCena = pocetnaCena.replace("Highest Bid:", "")
                        pocetnaCena = pocetnaCena.replace("EUR", "")
                        print(int(pocetnaCena))
                        pocetnaCena = int(pocetnaCena)
                        # print(startPrice[0].text)
            
                  #date
                  date = datetime.datetime.now()
                  print("Krece print")
                  print("PRINTANO \n \n \n \n")

                  badg = 0
                  if len(badge) != 0:
                        print("PROSO")
                        badg = int(badge[0].text)

                  options  = (badg * 2)+3
                  # print(options)

                  # print(
                  #     damageSlider[0],
            
                  # )
                  brojBrzina = '-'
                  x44 = '-'
                  marka = '-'
                  vrem = '00h 00mn'

                  if len(timer) != 0:
                        print("PROSO")
                        vrem = timer[0].text
                  else:
                        timer = []
                        timer = ["-"]
                  
                  if len(carList) != 0:
                        print("PROSO")
                        carList[0] = carList[0].text
                  else:
                        carList = []
                        carList = ["-"]


                  if len(main) >= 38+options:
                        print("PROSO")
                        brojBrzina = main2[38+options].text

                  if len(main) >= 38+options:
                        print("PROSO")
                        x44 = main2[40+options].text

                  if len(main2) >= 1:
                        print("PROSO")
                        marka = main2[1].text


                  modele2Var = '-'
                  if len(modele2) > 0:
                        modele2Var = modele2[0].text
                  
                  brojBrzVar = '-'
                  if len(brojBrz) > 0:
                        brojBrzVar = brojBrz[0].text

                  brojVratVar = '-'
                  if len(brojVrat) > 0:
                        brojVratVar = brojVrat[0].text

                  kubikazVar = '-'
                  if len(kubikaz) > 0:
                        kubikazVar = kubikaz[0].text

                  godinaProizVar = '-'
                  if len(godinaProiz) > 0:
                        godinaProizVar = godinaProiz[0].text

                  x44NewVar = '-'
                  if len(x44New) > 0:
                        x44NewVar = x44New[0].text


                  myJsonFile = {}
                  
                  
                  if(pocetnaCena!=0 and len(imagesSlider) > 0):

                        start = pocetnaCena
                        carina = (pocetnaCena+451)*0.05
                        pdv = (pocetnaCena+451)*0.21
                        before = pocetnaCena+carina+pdv+1321
                        final = 0

                        if(power[2].text == "Germany"):
                                     before = before+500
                        if(power[2].text == "Italy"): 
                                     before = before+300
                        if(power[2].text == "Spain"): 
                                     before = before+0
                        if(power[2].text == "Belgium"): 
                                     before = before+250
                        if(power[2].text == "Holland"): 
                                     before = before+300
                        if(power[2].text == "Czech"): 
                                     before = before+700
                        if(power[2].text == "Switzerland"): 
                                     before = before+400
                        if(power[2].text == "Luxembourg"): 
                                     before = before+250
                        if(marka == "Peugeot"):
                                     before=before-carina
                        final = before+(before*0.10)


                        if("mn" in vrem):
                              print("")
                        else:
                              vrem = str(vrem)+"00mn"

                        timerCh = str(vrem)
                        timerCh = timerCh.replace('d','')

                        timerCh = timerCh.replace('h','')
                        timerCh = timerCh.replace('mn','')
                        timerCh = timerCh.replace(' ','')

                        timerCh = int(timerCh)

                        
                        
                        
                        ##Taking files and sending to db
                        ##Taking files and sending to db
                        if(vrem == "00mn"):
                               timerCh = 99999

                        myJsonFile = {"title":title[0].text ,
                        "brojac":timerCh,
                        "list": "Auction","imgs": imagesSlider,
                        "kilometraza":power[0].text,"prvaReg":power[1].text,"zemlja":power[2].text,
                        "gorivo":power[3].text,"menjac":power[4].text,"sjedista":power[5].text, 
                        "marka":marka,
                        "registracija":main2[5].text,
                        "kljucevi":main2[9].text,
                        "emisija":main2[11].text,
                        "sjedista":power[5].text,
                        "timer":vrem,
                        "indBroj":main2[15].text,
                              "snaga":main2[17].text,
                              "boja":main2[19].text,
                              "noxEmisija":main2[21].text,
                              "model":modele2Var,
                              "godinaProizvodnje":godinaProizVar,
                              "brojVrata":brojVratVar,
                              "arvalLink":a,
                              "kubikaza":kubikazVar,
                              "brojBrzina":brojBrzVar,
                              "x44":x44NewVar,
                              "startPrice":pocetnaCena,
                              "final":int(final),
                              "before":int(before),
                              "odrzavanje":maintenance_array,
                              "oprema":options_array,
                              "createdAt":str(date)}
                        #if timer is active send else dont
                        if vrem != '':
                              sendToDb = Licitacija.insert_one(myJsonFile)
                              print("poslat")
                              print(marka + " if")
                              print(pocetnaCena )
                        else:
                              print("nije poslat")
               
                  else:
                      print("NO CLUE")
            except:
                  pass
                  


           

        #sending files to images array
            # images.append({"title":title[0].text , "list": carList[0].text,"imgs": carList[0].text }) #may change in future to img[?]
        
    print('I scraped '+ str(len(images)) + ' images!')
    time.sleep(1)
    print("Kraj funkcije")
    my_string_var3.set("Otvorene zavrsene")
    Main_window.update()




















    ########################
    ####KUPI ODMAHH 




def buy_now():



    driver = webdriver.Chrome("/usr/bin/chromedriver", options=chrome_options)



    #open the webpage
    driver.get("https://remktg.arval.com/buyer/#/login")

    button1 = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "#onetrust-accept-btn-handler"))).click()

    #target username
    username = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='username']")))
    password = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='password']")))

    #enter username and password
    username.clear()
    username.send_keys("GUEST")
    password.clear()
    password.send_keys("Proba1234*1234")

    #target the login button and click it

    button = WebDriverWait(driver, 2).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[type='submit']"))).click()

    button3 = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.modal-footer .btn-primary'))).click()
    print("clicked")
    #We are logged in!

    #wait 5 seconds to allow your new page to load
    time.sleep(5)



    images = []
    #itterate over both uploaded and tagged images respectively
    for i in ["buy-now"]:
        # ************************************************
        # !! change goldie.may.750 to your own address !!
        # ************************************************
        driver.get("https://remktg.arval.com/buyer/#/" + i + "/")
        time.sleep(5)
        driver.get("https://remktg.arval.com/buyer/#/" + i + "/")
        time.sleep(4)


    
        #scroll down
        #increase the range to sroll more
        #example: range(0,10) scrolls down 650+ images
        print("krece scrol")
        my_string_var2.set("Pronalazenje auta..")
        Main_window.update()
        print("krece scrol")
        for j in range(0,22):
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(1)
        time.sleep(5)
        #target all the link elements on the page
        anchors1 = driver.find_elements(By.CLASS_NAME, "d-block")
        anchors1 = [a.get_attribute('href') for a in anchors1]
        #narrow down all links to image links only
        anchors1 = [a for a in anchors1 if str(a).startswith("https://remktg.arval.com/buyer/#/item-details")]
        
        
        print('Found ' + str(len(anchors1)) + ' links to images in page 1')
        
        
        print("going to page 2")
        driver.get("https://remktg.arval.com/buyer/#/sales-events")
        time.sleep(4)
        driver.get("https://remktg.arval.com/buyer/#/buy-now?cntPageNo=1")
        time.sleep(7)
        print("krece scroll 2")
        for o in range(0,22):
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(1)
        #target all the link elements on the page
        anchors = driver.find_elements(By.CLASS_NAME, "d-block")
        anchors = [a.get_attribute('href') for a in anchors]
        #narrow down all links to image links only
        anchors = [a for a in anchors if str(a).startswith("https://remktg.arval.com/buyer/#/item-details")]
    

        anchors = anchors + anchors1
        print('Found ' + str(len(anchors)) + ' links to images in all pages')
        my_string_var2.set("Pronadjeno "+str(len(anchors))+" za buy Now")
        Main_window.update()
    
        #extract the [1]st image element in each link
        io=0
        for a in anchors:
 
            try:
                  io=io+1
                  my_string_var2.set("Ucitano "+str(io)+" od "+str(len(anchors)))
                  Main_window.update()
                  driver.get('https://remktg.arval.com/buyer/#/sales-events/204384')
                  time.sleep(1)
                  driver.get(a) #navigate to link
                  print("Otvoren link ",a)
                  time.sleep(8) #wait a bit
            
                  title = driver.find_elements(By.CSS_SELECTOR, "#submenu-main-characteristics")
                  startPrice = driver.find_elements(By.CSS_SELECTOR, "#buyitnow  div.row.no-gutters.ng-star-inserted  div.col-12.col-xl-6.pr-xl-3  div  span.font-weight-bold")
                  
                  main = driver.find_elements(By.CSS_SELECTOR, ".text-secondary-darker")
                  main2 = driver.find_elements(By.CSS_SELECTOR, ".card-text .row .col-12 div span")
                  model = driver.find_elements(By.CSS_SELECTOR, ".card-text .mb-5 .col-12 div span")
                  badge = driver.find_elements(By.CSS_SELECTOR, ".badge-primary")
                  timer = driver.find_elements(By.CSS_SELECTOR, ".card-title div app-timer-display span")
                  maintenance = driver.find_elements(By.CSS_SELECTOR, "#submenu-maintenance-history div .card-text table tbody tr td")
                  oprema = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div.row.text-caption.line-height-normal.mb-5.ng-star-inserted  div span ")
            
                  print(startPrice)
                  carList = driver.find_elements(By.CSS_SELECTOR, ".card-title .d-flex div")
                  imagesSlider = driver.find_elements(By.CSS_SELECTOR, "div.swiper-wrapper  div.swiper-slide.ng-star-inserted img")
            
            
                  damageSlider = driver.find_elements(By.CSS_SELECTOR, ".swiper-container-damage div div img")
                  imagesSlider = [img.get_attribute('src') for img in imagesSlider]
                  imagesSlider = [a for a in imagesSlider if str(a).startswith("..//pictures")]

                  damageSlider = [img.get_attribute('src') for img in damageSlider]
                  power = driver.find_elements(By.CSS_SELECTOR, ".card-text .mb-5 .text-secondary-darker")


                  
                  ##new
                  modele2 = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(1)  span.text-secondary-darker.w-50")
                  godinaProiz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(2)  span.text-secondary-darker.w-50")
                  kubikaz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(1)  span.text-secondary-darker.w-50")
                  brojVrat = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(6)  div  div:nth-child(5)  span.text-secondary-darker.w-50")
                  brojBrz = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(3)  span.text-secondary-darker.w-50")
                  x44New = driver.find_elements(By.CSS_SELECTOR, "#submenu-details  div  div.card-text.ng-star-inserted  div:nth-child(8)  div  div:nth-child(4)  span.text-secondary-darker.w-50")
            

            
                  print(len(oprema))

                  options_array = []
                  if(len(oprema) != 0):
                        for x in oprema:
                              options_array.append(x.text)


                  print(options_array)


                  print(len(startPrice))
                  print(len(maintenance))

                  maintenance_array = []
                  if(len(maintenance) != 0):
                        for x in maintenance:
                              maintenance_array.append(x.text)


                  print(maintenance_array)


                  pocetnaCena = 0
                  if(len(startPrice) != 0):
                        buggy_name = startPrice[0].text
                        pocetnaCena = buggy_name[:-4]
                        pocetnaCena = pocetnaCena.replace(",", "")
                        print(int(pocetnaCena))
                        pocetnaCena = int(pocetnaCena)
                        # print(startPrice[0].text)
            
                  #date
                  date = datetime.datetime.now()
                  print("Krece print")
                  print("PRINTANO \n \n \n \n")

                  badg = 0
                  if len(badge) != 0:
                        print("PROSO")
                        badg = int(badge[0].text)

                  options  = (badg * 2)+3
                  # print(options)

                  # print(
                  #     damageSlider[0],
            
                  # )
                  brojBrzina = '-'
                  x44 = '-'
                  marka = '-'
                  vrem = '00h 00mn'
                  if len(timer) != 0:
                        print("PROSO")
                        vrem = timer[0].text
                  else:
                        timer = []
                        timer = ["-"]
                  
                  if len(carList) != 0:
                        print("PROSO")
                        carList[0] = carList[0].text
                  else:
                        carList = []
                        carList = ["-"]


                  if len(main) >= 38+options:
                        print("PROSO")
                        brojBrzina = main2[38+options].text

                  if len(main) >= 40+options:
                        print("PROSO")
                        x44 = main2[40+options].text

                  if len(main2) >= 2:
                        print("PROSO")
                        marka = main2[1].text



                  modele2Var = '-'
                  if len(modele2) > 0:
                        modele2Var = modele2[0].text
                  
                  brojBrzVar = '-'
                  if len(brojBrz) > 0:
                        brojBrzVar = brojBrz[0].text

                  brojVratVar = '-'
                  if len(brojVrat) > 0:
                        brojVratVar = brojVrat[0].text

                  kubikazVar = '-'
                  if len(kubikaz) > 0:
                        kubikazVar = kubikaz[0].text

                  godinaProizVar = '-'
                  if len(godinaProiz) > 0:
                        godinaProizVar = godinaProiz[0].text

                  x44NewVar = '-'
                  if len(x44New) > 0:
                        x44NewVar = x44New[0].text



                  myJsonFile = {}
                  
                  
                  # if(len(main2) > 38+options and pocetnaCena!=0):
                  if(pocetnaCena!=0 and len(imagesSlider) > 0):

                        start = pocetnaCena
                        carina = (pocetnaCena+451)*0.05
                        pdv = (pocetnaCena+451)*0.21
                        before = pocetnaCena+carina+pdv+1321
                        final = 0

                        if(power[2].text == "Germany"):
                                    before = before+500
                        if(power[2].text == "Italy"): 
                                    before = before+300
                        if(power[2].text == "Spain"): 
                                    before = before+0
                        if(power[2].text == "Belgium"): 
                                    before = before+250
                        if(power[2].text == "Holland"): 
                                    before = before+300
                        if(power[2].text == "Czech"): 
                                    before = before+700
                        if(power[2].text == "Switzerland"): 
                                    before = before+400
                        if(power[2].text == "Luxembourg"): 
                                   before = before+250
                        if(marka == "Peugeot"):
                                  before=before-carina
                        final = before+(before*0.10)


                        
                        ##Taking files and sending to db
                        myJsonFile = {"title":title[0].text ,
                        "list": "List Name Buy Now - Stock (Buy Now)","imgs": imagesSlider,
                        "kilometraza":power[0].text,"prvaReg":power[1].text,"zemlja":power[2].text,
                        "gorivo":power[3].text,"menjac":power[4].text,"sjedista":power[5].text, 
                        "marka":marka,
                        "registracija":main2[5].text,
                        "kljucevi":main2[9].text,
                        "emisija":main2[11].text,
                        "sjedista":power[5].text,
                        "timer":vrem,
                        "indBroj":main2[15].text,
                              "snaga":main2[17].text,
                              "boja":main2[19].text,
                              "noxEmisija":main2[21].text,
                              "model":modele2Var,
                              "godinaProizvodnje":godinaProizVar,
                              "brojVrata":brojVratVar,
                              "arvalLink":a,
                              "kubikaza":kubikazVar,
                              "brojBrzina":brojBrzVar,
                              "x44":x44NewVar,
                              "startPrice":pocetnaCena,
                              "final":int(final),
                              "before":int(before),
                              "odrzavanje":maintenance_array,
                              "oprema":options_array,
                              "createdAt":str(date)}
                        #if timer is active send else dont
                        if vrem != 'h ghfdcsf gdfsd':
                              sendToDb = kupi.insert_one(myJsonFile)
                              print("poslat")
                              print(marka + " if")
                              print(pocetnaCena )
                        else:
                              print("nije poslat")
                   
                  else:
                      print("NO CLUE")
            except:
                  pass
                  


           

        #sending files to images array
            # images.append({"title":title[0].text , "list": carList[0].text,"imgs": carList[0].text }) #may change in future to img[?]
    driver.close()
    print('I scraped '+ str(len(images)) + ' images!')
    time.sleep(1)
    print("Kraj funkcije")
    my_string_var2.set("Buy Now zavrsen")
    Main_window.update()







def dugmeKupiOdmah():
    # delBuyNow = kupi.delete_many({})
    my_string_var2.set("Pokretanje ..")
    Main_window.update()
    print("Trying first time..!")
    time.sleep(1)
    try:
       print("buy_now pokretanje")
       buy_now()
    except:
       print("Error ocupied, trying again...")
       time.sleep(4)
       try:
          print("buy_now pokretanje")
        #   delBuyNow = kupi.delete_many({})
          buy_now()
       except:
          print("Pokusajte ponovo...")


def dugmeOtvorene():
    # delOtvorene = Licitacija.delete_many({})
    my_string_var3.set("Pokretanje ..")
    Main_window.update()
    print("Trying first time..!")
    time.sleep(1)
    try:
       print("Otvorene pokretanje")
       otvorene_file()
    except:
       print("Error ocupied, trying again...")
       time.sleep(4)
       try:
          print("Otvorene pokretanje")
        #   delOtvorene = Licitacija.delete_many({})
          otvorene_file()
       except:
          print("Pokusajte ponovo...")

def dugmeLicitacije():
    # delAuction = mycol.delete_many({})
    my_string_var.set("Pokretanje ..")
    Main_window.update()
    print("Trying first time..!")
    time.sleep(1)
    try:
       print("Otvorene pokretanje")
       test_file()
    except:
       print("Error ocupied, trying again...")
       time.sleep(4)
       try:
          print("Otvorene pokretanje")
        #   delAuction = mycol.delete_many({})
          test_file()
       except:
          print("Pokusajte ponovo...")

button1= Button(Main_window, text="Obnovi Licitacije", command = dugmeLicitacije)
button1.place(x=40, y=40)

button2= Button(Main_window, text="Obnovi Kupi Odmah", command = dugmeKupiOdmah)
button2.place(x=260, y=40)

button3= Button(Main_window, text="Obnovi Otvorene" , command= dugmeOtvorene)
button3.place(x=460, y=40)

# create a StringVar class
my_string_var = StringVar()

# create a StringVar class
my_string_var2 = StringVar()
my_string_var3 = StringVar()
 
# set the text
my_string_var.set("")
my_string_var2.set("")
my_string_var3.set("")
 
# create a label widget
my_label = Label(Main_window,
                 textvariable = my_string_var)
my_label.place(x=40, y=70)

my_label2 = Label(Main_window,
                 textvariable = my_string_var2)
my_label2.place(x=260, y=70)
 

my_label3 = Label(Main_window,
                 textvariable = my_string_var3)
my_label3.place(x=460, y=70)
 
 
# Start the GUI 
Main_window.mainloop()


     
