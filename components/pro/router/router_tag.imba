tag router

	def render
		self:__:A = self:__:A || {}
		<self> ( self:__:A[Router:view] || self:__:A[Router:view] = global:_T[Router:view.toUpperCase]() ).end
