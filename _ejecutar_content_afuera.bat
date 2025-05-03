cd _official-repo
cd Flowise-main
cd docker

@echo off
REM Comprobar si el contenedor "flowise" existe
docker container inspect flowise >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
    echo Iniciando contenedor existente: flowise
    docker start flowise
) ELSE (
    echo Contenedor no encontrado. Creando uno nuevo...
    docker run -d -p 3000:3000 -v D:\0_mmb\0_repos\Flowise\flowise-data:/root/.flowise --name flowise flowiseai/flowise
)


rem docker run -d -p 3000:3000 -v D:\0_mmb\0_repos\Flowise\flowise-data:/root/.flowise --name flowise flowiseai/flowise