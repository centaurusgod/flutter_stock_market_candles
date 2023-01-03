import json
import random

# Generate random stock price data for 7 days
price_data = []
for i in range(25):
    date = f"2022-01-{i+1}"
    high = random.randint(100, 200)
    low = random.randint(50, 100)
    open_price = random.randint(50, 200)
    close = random.randint(50, 200)
    volume = random.randint(10000, 100000)
    price_data.append({
        'date': date,
        'high': high,
        'low': low,
        'open': open_price,
        'close': close,
        'volume': volume
    })

# Convert the price data to JSON format
json_data = json.dumps(price_data)

# Write the JSON data to a file
with open('pricedata.json', 'w') as f:
    f.write(json_data)