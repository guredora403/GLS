class PromptsController < ApplicationController
    def index
        @prompts = Prompt.all
    end

    def show
        @prompt = Prompt.find(params[:id])
        @generated_contents = if @prompt.respond_to? :GeneratedContents
            @prompt.GeneratedContents
        else
            []
        end
    end

    def new_form
        @new_prompt = Prompt.new
    end

    def new
        @prompt = Prompt.new(prompt_params)
        if @prompt.save
            redirect_to "/prompts/#{@prompt.id}"
        else
            render :new_form
        end
    end
    private
    def prompt_params
        params.require(:prompt).permit(:title, :publisher, :description, :prompt_text)
    end
end
