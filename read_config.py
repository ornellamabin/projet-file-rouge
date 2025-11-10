import os

def read_config():
    config = {}
    try:
        with open('/tmp/releases.txt', 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    parts = line.split()
                    if len(parts) >= 2:
                        key = parts[0]
                        value = parts[1]
                        config[key] = value
                        print(f"Found config: {key} = {value}")
        
        # Écrire les variables d'environnement
        with open('/opt/set_env.sh', 'w') as f:
            for key, value in config.items():
                f.write(f'export {key}="{value}"\n')
                
        print("Configuration file created successfully")
        
    except Exception as e:
        print(f"Error reading config: {e}")

if __name__ == "__main__":
    read_config()
