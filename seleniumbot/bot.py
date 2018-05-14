from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
driver = webdriver.Remote(command_executor='http://remotewebdriver.local/wd/hub',
         desired_capabilities=DesiredCapabilities.CHROME)
driver.get("http://URL.LOCAL")
image = driver.get_screenshot_as_base64()
