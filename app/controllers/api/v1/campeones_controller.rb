module Api
    module V1
        class CampeonesController < ApplicationController
            def index
                #En un controlador se puede obtener datos de la db y podemos desplegar en una respuesta como un return o render en rails
                #http://localhost:3000/api/v1/campeones
                campeones = Campeon.order('created_at');
                render json: {
                    status: 'Exitoso men petición se cumplio',
                    message: 'Campeones cargados',
                    data: campeones
                }, status: :ok
            end

            def show  #metodo para obtener el campeon que queramos usando el id
                #http://localhost:3000/api/v1/campeones/2      postmsn
                campeon = Campeon.find(params[:id])
                render json: {
                    status: 'Exitoso men petición se cumplio',
                    message: 'solo un campeon',
                    data: campeon
                }, status: :ok
            end

            def create
                #como queremos crear un campeon debemos recibir los parametros exclusivamente del modelo Campeon y no de otro modelo
                #begin{
                    #"nombre": "katarina",
                    #"region": "noxus",
                    #"rol": "asesino",
                    #"comp": "asesinos"
                #}
                # method post, body, raw, sentencia con el json
                #http://localhost:3000/api/v1/campeones

                campeon = Campeon.new(campeon_params)
                if campeon.save
                    render json: {
                        status: 'Exitoso men petición se cumplio',
                        message: 'Campeon creado',
                        data: campeon
                    }, status: :ok
                else
                    render json: {
                        status: 'FALLIDO',
                        message: 'Campeon NO CREADO',
                        data: campeon.errors
                    }, status: :unprocessable_entity
                end
            end


            def destroy
                #http://localhost:3000/api/v1/campeones/2 
                campeon = Campeon.find(params[:id])
                if campeon.destroy
                    render json: {
                        status: 'Exitoso men petición se cumplio',
                        message: 'Campeon eliminadooooo',
                        data: campeon
                    }, status: :ok
                else
                    render json: {
                        status: 'FALLIDO',
                        message: 'Campeon NO ELIMINADO',
                        data: campeon.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                 #como queremos editar un campeon debemos recibir los parametros exclusivamente del modelo Campeon y no de otro modelo
                #begin{
                    #"nombre": "editado",
                    #"region": "noxus",
                    #"rol": "editado",
                    #"comp": "editados"
                #}
                # method put, body, raw, sentencia con el json
                #http://localhost:3000/api/v1/campeones/1   lo edite desde json
                campeon = Campeon.find(params[:id])
                if campeon.update_attributes(campeon_params)
                    render json: {
                        status: 'Exitoso men petición se cumplio',
                        message: 'Campeon actualizado',
                        data: campeon
                    }, status: :ok
                else
                    render json: {
                        status: 'FALLIDO',
                        message: 'Campeon NO ACTUALIZADO!!',
                        data: campeon.errors
                    }, status: :unprocessable_entity
                end
            end

            private
            def campeon_params #Parametros que queremos que se utilicen para le create y tiene que ser los mismos parametros que definimos como required en el modelo Campeon
                params.permit(:nombre,:region,:rol,:comp)
            end
        end
    end
end