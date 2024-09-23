class Payment:
    def GetPayment(self):
        pass

class GPay(Payment):
    def GetPayment(self):
        print("Speaking Google Payment Gateway")

class PhonePay(Payment):
    def GetPayment(self):
        print("Speaking Phonepay Gateway")

class AmazonPay(Payment):
    def GetPayment(self):
        print("Speaking Amazon Gateway")


gpay = GPay()
gpay.GetPayment()

phonepay = PhonePay()
phonepay.GetPayment()

amazonpay = AmazonPay()
amazonpay.GetPayment()
