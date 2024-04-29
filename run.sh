if echo "$@" | grep -q "backend"; then 
    cd backend
    git pull origin main
    ./gradlew clean && ./gradlew bootJar
    cd ..
fi
if echo "$@" | grep -q "frontend"; then 
    cd frontend
    git pull origin main
    npm install .
    npm run build
    cd ..
fi

docker compose stop
docker compose up -d --build $@
