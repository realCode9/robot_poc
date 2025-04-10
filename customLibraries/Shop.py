from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from robot.libraries.Collections import Collections

@library
class Shop:

    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def say_hello(self):
            print("Hello there")

    @keyword
    def add_items_to_cart(self, products_list):
        i = 1
        product_titles = self.seleniumLib.get_webelements("css:.card-title")
        for productTitle in product_titles:
            if productTitle.text in products_list:
                self.seleniumLib.wait_until_element_is_visible("xpath:(//div[@class='card-footer']/button)["+str(i)+"]")
                self.seleniumLib.click_button("xpath:(//div[@class='card-footer']/button)["+str(i)+"]")

            i=i+1
        self.seleniumLib.click_link("css:li.active a")

    # def verify_checkout_page_products(self):
    #     products_on_checkout_page = self.collectionLib.create_list()
    #     get_products_locator = self.seleniumLib.get_webelements("css:h4.media-heading a")
    #     for product in get_products_locator:
    #         product_text = product.text
    #         self.collectionLib.append_to_list(self, products_on_checkout_page, product_text)
    #
    #     return products_on_checkout_page


