from flask import Flask, request, jsonify
from bs4 import BeautifulSoup
from selenium import webdriver

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.by import By


app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    d = {}
    d['Query'] = str(request.args['Query'])
    return jsonify(d)


@app.route('/api', methods=['GET'])
def api():
    if request.method == 'GET':
        l = []
        d = {}
        cnt = 1

        #options = webdriver.FirefoxOptions()
        # set headless mode on
        # options.set_headless(True)

        opts = webdriver.FirefoxOptions()
        opts.headless = True

        driver = webdriver.Firefox(
            executable_path=r'C:\Users\Jegadit\Desktop\pah\works\flutter\LocationBasedSearch\python\geckodriver-v0.30.0-win64\geckodriver.exe', options=opts)

        #url = 'https://www.instagram.com/explore/locations/'
        url = 'https://www.instagram.com/accounts/login/?next=/explore/locations/'
        driver.get(url)

        username = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='username']")))

        password = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='password']")))

        username.clear()
        password.clear()

        username.send_keys('w_ha_t_n_am_e')
        password.send_keys('6iQzZWMzy7TTKjj')

        log_in = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "button[type='submit']"))).click()

        not_now = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.XPATH, "//button[contains(text(), 'Not Now')]"))).click()

        soup = BeautifulSoup(driver.page_source, 'html.parser')

        for x in soup.findAll('a', {'class': 'aMwHK'}):
            l.append(
                {
                    'count': cnt,
                    'name': str('https://www.instagram.com/explore/locations/'+x.text),
                    'link': str('https://www.instagram.com'+x['href'])
                }
            )
            cnt += 1
    # print(l)
        return jsonify(l)


if __name__ == '__main__':
    app.run(debug=True)
