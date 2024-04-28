if echo "$@" | grep -q "backend"; then 
    cd backend
    ./gradlew clean && ./gradlew bootJar
    cd ..
elif echo "$@" | grep -q "frontend"; then 
    cd frontend
    npm run build
    cd ..
fi

docker compose up --build $@
