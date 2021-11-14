import math

dot_product = lambda X, Y: sum(map(lambda x, y: x * y, X, Y))

def sigma(t):
    return 1 / (1 + math.exp(-t))
    
def sigma_prime(t):
    sigma_value = sigma(t)
    return sigma_value * (1 - sigma_value)