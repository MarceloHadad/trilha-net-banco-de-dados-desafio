-- 1 - Buscar o nome e ano dos filmes
SELECT [Nome], [Ano]
FROM dbo.Filmes;

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT [Nome], [Ano]
FROM dbo.Filmes
ORDER BY [Ano] ASC

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT [Nome], [Ano], [Duracao]
FROM dbo.Filmes
WHERE [Nome] = 'de volta para o futuro'

-- 4 - Buscar os filmes lançados em 1997
SELECT [Nome], [Ano], [Duracao]
FROM dbo.Filmes
WHERE [Ano] = 1997

-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT [Nome], [Ano], [Duracao]
FROM dbo.Filmes
WHERE [Ano] > 2000

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT [Nome], [Ano], [Duracao]
FROM dbo.Filmes
WHERE 1 = 1
    AND [Duracao] > 100
    AND [Duracao] < 150
ORDER BY [Duracao]

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT [Ano], COUNT([Id]) AS [Quantidade]
FROM dbo.Filmes
GROUP BY [Ano]
ORDER BY [Quantidade] DESC

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT [Id], [PrimeiroNome], [UltimoNome], [Genero]
FROM dbo.Atores
WHERE [Genero] = 'M'

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT [Id], [PrimeiroNome], [UltimoNome], [Genero]
FROM dbo.Atores
WHERE [Genero] = 'F'
ORDER BY [PrimeiroNome]

-- 10 - Buscar o nome do filme e o gênero
SELECT [tFilmes].[Nome], [tGeneros].[Genero]
FROM dbo.FilmesGenero [tFilmesGenero]
    INNER JOIN dbo.Filmes [tFilmes] ON tFilmesGenero.IdFilme = tFilmes.Id
    INNER JOIN dbo.Generos [tGeneros] ON tFilmesGenero.IdGenero = tGeneros.Id

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT [tFilmes].[Nome], [tGeneros].[Genero]
FROM dbo.FilmesGenero [tFilmesGenero]
    INNER JOIN dbo.Filmes [tFilmes] ON tFilmesGenero.IdFilme = tFilmes.Id
    INNER JOIN dbo.Generos [tGeneros] ON tFilmesGenero.IdGenero = tGeneros.Id
WHERE [tGeneros].[Genero] = 'Mistério'

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT [tFilmes].[Nome], [tAtores].[PrimeiroNome], [tAtores].[UltimoNome], [tElencoFilme].[Papel]
FROM dbo.ElencoFilme [tElencoFilme]
    INNER JOIN dbo.Filmes [tFilmes] ON tElencoFilme.IdFilme = tFilmes.Id
    INNER JOIN dbo.Atores [tAtores] ON tElencoFilme.IdAtor = tAtores.Id
