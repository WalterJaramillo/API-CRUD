Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do 
      resources :campeones  # Se accede a la ruta /api/v1/campeones   | ruta para enviar los datos puede ser desde postman
    end
  end
end
