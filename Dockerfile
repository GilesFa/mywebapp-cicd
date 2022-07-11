FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
COPY *.csproj ./app/MyWebApp/
WORKDIR /app/MyWebApp
RUN dotnet restore
COPY . ./
RUN dotnet publish -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
EXPOSE 80
COPY --from=build /app/MyWebApp/out ./
ENTRYPOINT ["dotnet", "MyWebApp.dll"]