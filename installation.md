La única que funcionó fue con docker. Las demás locales no funcionó ninguna.

La información queda guardada en el repositorio dentro de flowise-data.
Ejecutar desde \_ejecutar_content_afuera.bat hace la gracia de crear el container docker apuntando a la ubicacion D:\0_mmb\0_repos\Flowise\flowise-data como destino de la información del docker.
Una vez que se crea el container, hay que apagarlo, borrar el contenido de flowise-data y restituir el que esta guardada en mi repo de flowise. De esa forma, al volver a levantar el container, este va a tener toda la información anterior.
