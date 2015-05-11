#ZM: This is not a correct helper, should live on the model.
def check_params_for_survey(params)
   params["answers"].values.any?{|ans| ans.all? { |elem| elem == "" }}
end
