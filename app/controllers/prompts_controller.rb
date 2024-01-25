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

    def new_content
        @prompt = Prompt.find(params[:id])
        @new_generated_content = GeneratedContent.new
    end

    def add_content
        @new_generated_content = GeneratedContent.new(generatedContent_params)
        @new_generated_content.prompt_id = params[:id]
        if @new_generated_content.save
            redirect_to "/prompts/#{@new_generated_content.prompt.id}"
        else
            render :new_content
        end
    end
    private
    def prompt_params
        params.require(:prompt).permit(:title, :publisher, :description, :prompt_text)
    end
    def generatedContent_params
        params.require(:generated_content).permit(:text, :publisher, :URL)
    end
end
