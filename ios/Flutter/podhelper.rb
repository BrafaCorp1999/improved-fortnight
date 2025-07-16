# Este es el archivo podhelper.rb que se usa para configurar Flutter con CocoaPods

flutter_application_path = '../'

# Asegúrate de que esta ruta sea válida en tu proyecto. Si no lo es, debes ajustarla.
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
