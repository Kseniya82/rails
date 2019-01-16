module QuestionsHelper
 def question_header
   if action_name == 'edit'
     "Edit #{@test.title} question"
   else
     "Create New #{@test.title} question"
   end
 end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
