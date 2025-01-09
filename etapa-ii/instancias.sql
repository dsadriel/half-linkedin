-- Instâncias
-- O conteúdo deste arquivo foi criado com auxilio de ferramentas de inteligência artificial (GPT 4o e 4o-mini)

-- DADOS PARA A TABELA TIPO_MODALIDADE --
INSERT INTO TIPO_MODALIDADE (modalidade) VALUES 
('Remoto'), ('Presencial'), ('Híbrido');

INSERT INTO TIPO_EMPREGO (nome) VALUES
('Estágio'),
('CLT'),
('PJ'),
('Freelancer');

-- DADOS PARA A TABELA PERFIL (10 PESSOAIS E 5 EMPRESARIAIS) --
INSERT INTO PERFIL VALUES
('john_doe', 'John Doe', 'Desenvolvedor de software com experiência em IA', 'São Paulo, SP', 'https://hlinkedin.com/johndoe.jpg', 'https://hlinkedin.com/johndoecover.jpg', 'john.doe@example.com'),
('jane_smith', 'Jane Smith', 'Designer gráfica especializada em branding', 'Rio de Janeiro, RJ', 'https://hlinkedin.com/janesmith.jpg', 'https://hlinkedin.com/janesmithcover.jpg', 'jane.smith@example.com'),
('lucas_santos', 'Lucas Santos', 'Analista financeiro apaixonado por números', 'Porto Alegre, RS', 'https://hlinkedin.com/lucassantos.jpg', 'https://hlinkedin.com/lucassantoscover.jpg', 'lucas.santos@example.com'),
('mariana_oliveira', 'Mariana Oliveira', 'Psicóloga com foco em desenvolvimento pessoal', 'Curitiba, PR', 'https://hlinkedin.com/marianaoliveira.jpg', 'https://hlinkedin.com/marianaoliveiracover.jpg', 'mariana.oliveira@example.com'),
('carla_mendes', 'Carla Mendes', 'Engenheira ambiental buscando soluções sustentáveis', 'Belo Horizonte, MG', 'https://hlinkedin.com/carlamendes.jpg', 'https://hlinkedin.com/carlamendescover.jpg', 'carla.mendes@example.com'),
('roberto_lima', 'Roberto Lima', 'Especialista em marketing digital', 'Salvador, BA', 'https://hlinkedin.com/robertolima.jpg', 'https://hlinkedin.com/robertolimacover.jpg', 'roberto.lima@example.com'),
('sofia_ferreira', 'Sofia Ferreira', 'Médica veterinária apaixonada por animais', 'Florianópolis, SC', 'https://hlinkedin.com/sofiaferreira.jpg', 'https://hlinkedin.com/sofiaferreiracover.jpg', 'sofia.ferreira@example.com'),
('pedro_almeida', 'Pedro Almeida', 'Professor de matemática e autor de livros didáticos', 'Fortaleza, CE', 'https://hlinkedin.com/pedroalmeida.jpg', 'https://hlinkedin.com/pedroalmeidacover.jpg', 'pedro.almeida@example.com'),
('ana_clara', 'Ana Clara', 'Chef de cozinha especializada em culinária vegana', 'Brasília, DF', 'https://hlinkedin.com/anaclara.jpg', 'https://hlinkedin.com/anaclaracover.jpg', 'ana.clara@example.com'),
('gustavo_pereira', 'Gustavo Pereira', 'Arquiteto focado em design moderno', 'Recife, PE', 'https://hlinkedin.com/gustavopereira.jpg', 'https://hlinkedin.com/gustavopereiracover.jpg', 'gustavo.pereira@example.com'),

('tech_innovators', 'Tech Innovators', 'Líder em inovação tecnológica', 'São Paulo, SP', 'https://hlinkedin.com/techinnovators.jpg', 'https://hlinkedin.com/techinnovatorscover.jpg', 'contact@techinnovators.com'),
('green_solutions', 'Green Solutions', 'Empresa de soluções ecológicas', 'Rio de Janeiro, RJ', 'https://hlinkedin.com/greensolutions.jpg', 'https://hlinkedin.com/greensolutionscover.jpg', 'contact@greensolutions.com'),
('healthcare_plus', 'Healthcare Plus', 'Centro médico focado em bem-estar', 'Porto Alegre, RS', 'https://hlinkedin.com/healthcareplus.jpg', 'https://hlinkedin.com/healthcarepluscover.jpg', 'contact@healthcareplus.com'),
('edu_future', 'Edu Future', 'Plataforma de ensino online', 'Curitiba, PR', 'https://hlinkedin.com/edufuture.jpg', 'https://hlinkedin.com/edufuturecover.jpg', 'contact@edufuture.com'),
('build_smart', 'Build Smart', 'Construtora especializada em tecnologia sustentável', 'Belo Horizonte, MG', 'https://hlinkedin.com/buildsmart.jpg', 'https://hlinkedin.com/buildsmartcover.jpg', 'contact@buildsmart.com');

-- DADOS PARA A TABELA PERFIL_COMPANHIA --
INSERT INTO PERFIL_COMPANHIA VALUES
('tech_innovators'),
('green_solutions'),
('healthcare_plus'),
('edu_future'),
('build_smart');

-- DADOS PARA A TABELA PERFIL_PESSOAL --
INSERT INTO PERFIL_PESSOAL VALUES
('john_doe', 'Aspirante a líder técnico em IA'),
('jane_smith', 'Artista visual em constante aprendizado'),
('lucas_santos', 'Entusiasta de investimentos e planejamento financeiro'),
('mariana_oliveira', 'Transformando vidas através da psicologia'),
('carla_mendes', 'Comprometida com o meio ambiente'),
('roberto_lima', 'Criando estratégias digitais de sucesso'),
('sofia_ferreira', 'Cuidando da saúde animal com dedicação'),
('pedro_almeida', 'Ampliando horizontes com a matemática'),
('ana_clara', 'Reinventando a gastronomia vegana'),
('gustavo_pereira', 'Explorando o futuro da arquitetura');

-- INSERINDO DADOS NA TABELA PUBLICACAO --
INSERT INTO PUBLICACAO VALUES
(1, 'john_doe', '2025-01-01', 'Feliz Ano Novo! 🎉 Que 2025 seja cheio de conquistas! 🙌 Que este ano nos traga novas oportunidades de crescimento pessoal e profissional. Vamos nos dedicar a realizar nossos objetivos com coragem, foco e determinação. 💪 Que todos tenham um ano repleto de sucesso, saúde e aprendizados! ✨ Que possamos superar desafios e celebrar nossas vitórias, grandes e pequenas. Estamos prontos para o que vem por aí! 🚀 #AnoNovo #Metas #Conquistas #Sucesso #2025'),
(2, 'jane_smith', '2025-01-02', 'Explorando novas ideias para meu portfólio de design. 🎨 Se você é designer ou tem alguma sugestão criativa, adoraria ouvir suas ideias! 💭 Estou buscando formas de inovar e trazer algo novo para os projetos deste ano. 📐 Juntos podemos pensar fora da caixa! 💡 Se você tem referências ou quer trocar ideias sobre design, estou super aberta! Vamos compartilhar criatividade! 🌟 #Design #Criatividade #Portfólio #Inovação'),
(3, 'lucas_santos', '2025-01-03', 'O mercado financeiro nunca dorme. 💼 Vamos falar sobre investimentos? 📈 Em tempos de incerteza, o conhecimento financeiro se torna um diferencial! 💡 Estou aqui para compartilhar dicas e insights sobre como planejar suas finanças, diversificar investimentos e estratégias para alcançar objetivos financeiros de longo prazo. 📊 Se você está começando agora ou já investe, vamos trocar ideias sobre como otimizar sua carteira de investimentos. Juntos, podemos fazer 2025 um ano de grandes resultados financeiros! 💰 #Investimentos #FinançasPessoais #MercadoFinanceiro #EducaçãoFinanceira'),
(4, 'mariana_oliveira', '2025-01-04', 'Começando um novo ciclo de atendimentos em 2025. 💙 Vamos juntos! Este ano é um marco na minha jornada profissional, e estou mais do que pronta para oferecer o melhor suporte aos meus clientes. 🙏 Se você está buscando desenvolvimento pessoal ou profissional, venha conversar comigo! Juntos podemos criar estratégias personalizadas para alcançar seus objetivos e superar qualquer obstáculo. 🌱 Que 2025 seja um ano de transformação e sucesso para todos nós! 🌟 #Atendimento #DesenvolvimentoPessoal #Metas #Transformação'),
(5, 'carla_mendes', '2025-01-05', 'Soluções sustentáveis são o futuro! 🌍 Vamos fazer nossa parte! Com o aumento das mudanças climáticas e a necessidade de adaptação, buscar alternativas mais verdes se torna uma prioridade. ♻️ Estou empenhada em explorar novas formas de reduzir o impacto ambiental e contribuir para um mundo mais sustentável. 🌱 Cada ação conta, seja em casa, no trabalho ou em nossas comunidades. Juntos, podemos fazer a diferença! 🌎 Vamos trocar ideias sobre como implementar práticas mais sustentáveis no dia a dia? #Sustentabilidade #MeioAmbiente #FuturoVerde #MudançasClimáticas'),
(6, 'roberto_lima', '2025-01-06', 'Campanhas digitais transformadoras estão a caminho. 🌐 Fique ligado! Estamos cada vez mais imersos em um mundo digital e as campanhas de marketing e publicidade estão se transformando para acompanhar as novas tendências. 📱 Em 2025, a personalização e a interação serão as palavras de ordem. 💬 Se você quer se destacar no ambiente digital, vamos conversar sobre como usar as estratégias mais inovadoras para engajar sua audiência. Prepare-se para um ano de campanhas impactantes e resultados incríveis! 🚀 #MarketingDigital #Campanhas #Inovação #Publicidade'),
(7, 'sofia_ferreira', '2025-01-07', 'A saúde dos pets importa! 🐾 Dicas para cuidados com seu animal de estimação. Se você ama seu pet tanto quanto eu, sabe o quanto é importante cuidar da saúde deles. 💕 Hoje compartilho algumas dicas essenciais para garantir que seu animalzinho tenha uma vida saudável e feliz: alimentação balanceada, visitas regulares ao veterinário e muita diversão ao ar livre! 🌳 Vamos cuidar de nossos amigos peludos com carinho e responsabilidade! 🐶🐱 #SaúdeAnimal #CuidadosComPets #BemEstarAnimal'),
(8, 'pedro_almeida', '2025-01-08', 'Matemática no dia a dia: onde você menos espera! 🔢 Sabia que a matemática está presente em muitos aspectos do nosso cotidiano? Desde calcular o troco no mercado até entender a otimização dos processos em empresas. 💡 Em 2025, vamos explorar de forma simples e prática como usar a matemática para tomar decisões mais informadas no nosso dia a dia. Se você é apaixonado por números ou quer aprender mais, venha se aprofundar neste tema comigo! 📚 #Matemática #Educação #Lógica #DesafiosMatemáticos'),
(9, 'ana_clara', '2025-01-09', 'Novas receitas veganas incríveis chegando em breve! 🥑🍓 Se você é como eu e ama explorar novas opções de receitas saudáveis, 2025 será um ano cheio de novidades! Estou preparando algumas receitas veganas deliciosas para todos os gostos. 🌱 Desde pratos principais até sobremesas que vão surpreender seu paladar! Fique ligado para aprender a fazer receitas simples e nutritivas. Vamos cozinhar juntos e transformar a alimentação de forma saudável e criativa! 👩‍🍳 #ReceitasVeganas #AlimentaçãoSaudável #CulináriaVegana'),
(10, 'gustavo_pereira', '2025-01-10', 'Inspiração para projetos arquitetônicos modernos. 🏙️ A arquitetura é uma forma de arte que influencia diretamente nosso bem-estar e a estética dos espaços em que vivemos. Este ano, estou focado em trazer inspiração para criar projetos modernos e inovadores que misturem funcionalidade, estética e sustentabilidade. 🌿 Se você está trabalhando em algum projeto ou quer ideias criativas para ambientes modernos, estou aqui para compartilhar meu conhecimento! Vamos construir juntos um futuro mais bonito e eficiente! 🏡 #ArquiteturaModerna #DesignDeInteriores #Sustentabilidade #Inovação'),
(11, 'tech_innovators', '2025-01-11', 'Tecnologia para um amanhã melhor. 🚀 Explore nossas inovações! Estamos em um momento empolgante na história da tecnologia, com grandes avanços a cada dia. Se você também é apaixonado por inovação, venha descobrir como as novas tecnologias estão transformando os negócios e a sociedade. 🤖 De inteligência artificial a soluções sustentáveis, as possibilidades são infinitas! Vamos juntos construir um futuro mais inteligente, conectado e inclusivo! 💡 #Tecnologia #Inovação #FuturoDigital'),
(12, 'green_solutions', '2025-01-12', 'Juntos por um planeta mais verde! 🌿 Conheça nossos projetos. Em 2025, queremos ampliar nossas ações em prol do meio ambiente, com soluções inovadoras e sustentáveis. ♻️ Nosso objetivo é promover práticas que ajudem a reduzir o impacto ambiental e a criar um futuro mais equilibrado. Se você está em busca de ideias sobre como implementar práticas sustentáveis, vamos trocar experiências! Cada pequeno gesto pode transformar o mundo. 🌍 #Sustentabilidade #MeioAmbiente #ProjetosVerdes'),
(13, 'healthcare_plus', '2025-01-13', 'Cuidando do seu bem-estar. 🌱 Agende sua consulta hoje mesmo! Sabemos que a saúde é o nosso bem mais precioso. Por isso, estamos comprometidos em oferecer o melhor atendimento para você. Desde consultas preventivas até tratamentos especializados, estamos aqui para cuidar de você com atenção e dedicação. 💙 Não adie o cuidado com a sua saúde. Agende já sua consulta e comece o ano com o pé direito! 🩺 #Saúde #BemEstar #AtendimentoDeQualidade'),
(14, 'edu_future', '2025-01-14', 'Aprenda no seu tempo. ⏰ Conheça nossa plataforma! Se você está em busca de aprender novas habilidades e expandir seus conhecimentos, nossa plataforma de educação online oferece cursos flexíveis que se encaixam na sua rotina. 💻 Desde cursos técnicos até desenvolvimento pessoal, temos uma variedade de opções para todos os gostos. Vamos juntos rumo ao seu desenvolvimento? 🚀 #EducaçãoOnline #Aprendizado #DesenvolvimentoPessoal'),
(15, 'build_smart', '2025-01-15', 'Construindo com tecnologia sustentável para o futuro. 🏗️ Em 2025, a construção civil precisa ser cada vez mais eficiente e sustentável. Por isso, estamos inovando com tecnologias que não apenas otimizam os processos, mas também preservam o meio ambiente. 🌍 Se você está envolvido em projetos de construção ou busca soluções mais verdes, venha descobrir as tendências que estão moldando o futuro da arquitetura e construção! 🔧 #ConstruçãoSustentável #Tecnologia #InovaçãoNaConstrução'),
(16, 'jane_smith', '2025-01-16', 'Alguém mais está empolgado com o novo software de design que será lançado? 🎨📲 Eu estou super animada para ver como ele vai transformar a forma como criamos e interagimos com nossos projetos! 💻 Este software promete trazer uma série de novas funcionalidades que vão facilitar o processo criativo e aumentar a produtividade. 🚀 Se você também está esperando ansiosamente, vamos trocar ideias sobre o que mais gostaríamos de ver nesse novo lançamento! 💭💡 #Design #Tecnologia #Inovação #Criatividade'),
(17, 'carla_mendes', '2025-01-17', 'Explorando novas formas de reduzir o impacto ambiental. 🌱🌍 No começo de 2025, estou focada em pensar em soluções criativas e sustentáveis para minimizar nossa pegada ecológica. ♻️ Cada um de nós pode contribuir de pequenas maneiras, como a redução do consumo de plástico, o uso de fontes de energia renováveis e a promoção de práticas mais ecológicas no nosso dia a dia. Vamos compartilhar ideias sobre como podemos ser mais sustentáveis? 🌿 Juntos, podemos criar um futuro mais verde! 💚 #Sustentabilidade #ImpactoAmbiental #VidaVerde'),
(18, 'lucas_santos', '2025-01-18', 'Dicas de livros sobre economia e mercado financeiro. 📚💰 Se você, assim como eu, adora aprender sobre economia e finanças, estou compartilhando alguns livros incríveis que fazem a diferença na forma como pensamos sobre o mercado financeiro. 📈 Estes livros não só oferecem conhecimento prático, mas também nos ensinam a tomar decisões mais informadas. Vamos trocar recomendações de leitura e aprender juntos! 💡📖 #Economia #Investimentos #Livros #MercadoFinanceiro'),
(19, 'sofia_ferreira', '2025-01-19', 'Castração: um ato de amor e responsabilidade. 🐱🐶 Castrar o seu pet é um gesto de cuidado e responsabilidade. Além de evitar o aumento de animais abandonados, a castração traz benefícios para a saúde do seu animalzinho. 💉 Vamos espalhar mais informações sobre a importância desse procedimento e garantir que todos os pets tenham uma vida mais saudável e longeva! 💙 Se você tem dúvidas ou precisa de mais informações, estou aqui para ajudar. Vamos juntos promover o bem-estar dos nossos amigos peludos! 🌟 #SaúdeAnimal #Castração #BemEstarPet'),
(20, 'ana_clara', '2025-01-20', 'Organizando um workshop de culinária vegana. 🥑🍴 Inscreva-se! Estou super animada para compartilhar com você minhas receitas veganas favoritas em um workshop prático! 🍓🌱 Vamos aprender a fazer pratos deliciosos, saudáveis e cheios de sabor, perfeitos para qualquer ocasião. Se você quer explorar uma alimentação mais consciente e saborosa, junte-se a nós! 💚 Não perca essa oportunidade de aprender e se inspirar! Inscreva-se já e vamos cozinhar juntos! 👩‍🍳 #CulináriaVegana #WorkshopDeCulinária #AlimentaçãoSaudável'),

-- Comentários
(21, 'jane_smith', '2025-01-21', 'Obrigada pela mensagem inspiradora, John! Que 2025 seja incrível para todos nós. 🙏'),
(22, 'lucas_santos', '2025-01-21', 'Ótima reflexão sobre o mercado financeiro, John! Adicionei à minha lista de leituras um livro sobre psicologia financeira. Se você tiver recomendações, me avise.'),
(23, 'mariana_oliveira', '2025-01-22', 'Interessante sua perspectiva, Carla! O impacto ambiental pode ser reduzido com pequenas mudanças no nosso cotidiano. Estou pensando em fazer um post sobre isso em breve.'),
(24, 'carla_mendes', '2025-01-22', 'Sofia, adorei sua publicação! É tão importante conscientizar as pessoas sobre a castração. Vou compartilhar com amigos que têm pets.'),
(25, 'roberto_lima', '2025-01-23', 'Pedro, adoro ver como você traz a matemática para o dia a dia. Já pensou em criar vídeos curtos para redes sociais explicando conceitos? Acho que seria um sucesso!'),
(26, 'sofia_ferreira', '2025-01-23', 'Obrigada pela sugestão, Mariana! Vou pesquisar mais sobre materiais ecológicos para incluir em meus próximos posts. É sempre bom aprender algo novo.'),
(27, 'ana_clara', '2025-01-24', 'Estou muito empolgada com o workshop de culinária vegana! Vou abordar a importância de refeições balanceadas e como adaptar receitas tradicionais para essa dieta.'),
(28, 'gustavo_pereira', '2025-01-24', 'Tecnologia sustentável é o futuro, Build Smart! Tenho ideias de como integrar sistemas de energia renovável a projetos arquitetônicos.'),
(29, 'tech_innovators', '2025-01-25', 'Green Solutions, adoramos seu post! Há tanto que podemos fazer em parceria para promover inovações ecológicas e tecnológicas. Vamos conversar sobre isso.'),

-- Comentários respondendo aos comentários
(30, 'edu_future', '2025-01-25', 'Mariana, seria incrível desenvolvermos um módulo de psicologia positiva na nossa plataforma de ensino online. Você tem interesse em colaborar?'),
(31, 'lucas_santos', '2025-01-22', 'Concordo, Jane! Vamos fazer deste ano o melhor de todos. 🚀'),
(32, 'john_doe', '2025-01-22', 'Lucas, recomendo "O Investidor Inteligente" de Benjamin Graham. É um clássico!'),
(33, 'carla_mendes', '2025-01-23', 'Mariana, seria ótimo ver mais posts sobre como pequenas mudanças podem fazer uma grande diferença.'),
(34, 'sofia_ferreira', '2025-01-23', 'Carla, obrigada! A conscientização é fundamental para o bem-estar dos nossos pets.'),
(35, 'pedro_almeida', '2025-01-24', 'Roberto, ótima ideia! Vou começar a trabalhar em alguns vídeos curtos sobre conceitos matemáticos.');


-- INSERINDO DADOS NA TABELA PUBLICACAO_FEED --
INSERT INTO PUBLICACAO_FEED VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

-- INSERINDO DADOS NA TABELA COMENTARIO --
INSERT INTO COMENTARIO VALUES
(21, 1),
(22, 3),
(23, 5),
(24, 7),
(25, 8),
(26, 6),
(27, 9),
(28, 15),
(29, 12),
(30, 4),
(31, 21),
(32, 22),
(33, 23),
(34, 24),
(35, 25);

-- Inserindo eventos relacionados às empresas
INSERT INTO EVENTO (id_evento, nome, data_evento, foto_capa, descricao, localizacao, id_perfil, modalidade) 
VALUES 
('tech_innovators_conference_2025', 'Tech Innovators Conference 2025', '2025-05-15', 'https://hlinkedin.com/techinnovatorsconference2025.jpg', 'Conferência sobre inovações tecnológicas e o futuro da inteligência artificial.', 'São Paulo, SP', 'tech_innovators', 'Presencial'),
('green_solutions_sustainability_day', 'Green Solutions Sustainability Day', '2025-06-20', 'https://hlinkedin.com/greensolutionssustainabilityday.jpg', 'Evento de discussão sobre soluções ecológicas e práticas sustentáveis no mercado.', 'Rio de Janeiro, RJ', 'green_solutions', 'Presencial'),
('healthcare_plus_wellness_summit', 'Healthcare Plus Wellness Summit', '2025-07-10', 'https://hlinkedin.com/healthcarepluswellnesssummit.jpg', 'Cúpula sobre bem-estar e saúde integral com foco no futuro da medicina.', 'Porto Alegre, RS', 'healthcare_plus', 'Híbrido'),
('edu_future_online_education_forum', 'Edu Future Online Education Forum', '2025-08-12', 'https://hlinkedin.com/edufutureonlineeducationforum.jpg', 'Fórum de discussão sobre o futuro da educação online e plataformas de aprendizado.', 'Curitiba, PR', 'edu_future', 'Remoto'),
('build_smart_smart_building_expo', 'Build Smart Smart Building Expo', '2025-09-05', 'https://hlinkedin.com/buildsmartsmartbuildingexpo.jpg', 'Exposição sobre construções inteligentes e tecnologias sustentáveis na arquitetura.', 'Belo Horizonte, MG', 'build_smart', 'Presencial'),
('tech_innovators_ai_workshop', 'Tech Innovators AI Workshop', '2025-10-01', 'https://hlinkedin.com/techinnovatorsaiworkshop.jpg', 'Workshop sobre uso de inteligência artificial em soluções de tecnologia.', 'São Paulo, SP', 'tech_innovators', 'Presencial'),
('green_solutions_ecology_innovation', 'Green Solutions Ecology & Innovation', '2025-11-14', 'https://hlinkedin.com/greensolutionsecologyinnovation.jpg', 'Encontro sobre inovações ecológicas para o futuro sustentável.', 'Rio de Janeiro, RJ', 'green_solutions', 'Híbrido'),
('healthcare_plus_virtual_health_fair', 'Healthcare Plus Virtual Health Fair', '2025-12-05', 'https://hlinkedin.com/healthcareplusvirtualhealthfair.jpg', 'Feira virtual sobre os mais recentes avanços em saúde e bem-estar.', 'Porto Alegre, RS', 'healthcare_plus', 'Remoto'),
('edu_future_tech_in_education', 'Edu Future: Tech in Education', '2026-01-22', 'https://hlinkedin.com/edufuturetechineducation.jpg', 'Evento sobre como a tecnologia está transformando a educação e o ensino a distância.', 'Curitiba, PR', 'edu_future', 'Presencial'),
('build_smart_sustainability_in_construction', 'Build Smart: Sustainability in Construction', '2026-02-18', 'https://hlinkedin.com/buildsmartsustainabilityinconstruction.jpg', 'Debate sobre sustentabilidade e inovação na indústria da construção civil.', 'Belo Horizonte, MG', 'build_smart', 'Presencial');

-- Inserindo vagas de emprego
INSERT INTO VAGA (id_vaga, id_perfil, data_publicacao, nome, descricao, localizacao, modalidade) 
VALUES 
(1, 'tech_innovators', '2025-01-10', 'Desenvolvedor de Software', 'Procuramos desenvolvedor de software com experiência em tecnologias como Python, JavaScript e aprendizado de máquina. Você será responsável por criar soluções inovadoras para nossos produtos.', 'São Paulo, SP', 'Presencial'),
(2, 'tech_innovators', '2025-01-12', 'Especialista em Inteligência Artificial', 'Estamos recrutando um especialista em IA para trabalhar no desenvolvimento de soluções baseadas em aprendizado de máquina e IA aplicada aos nossos produtos tecnológicos.', 'São Paulo, SP', 'Presencial'),
(3, 'tech_innovators', '2025-01-15', 'Engenheiro de Software', 'Procuramos engenheiro de software para trabalhar em equipes ágeis no desenvolvimento de sistemas e produtos inovadores. A experiência com plataformas de nuvem é desejada.', 'São Paulo, SP', 'Presencial'),
(4, 'tech_innovators', '2025-01-18', 'Analista de Dados', 'Estamos buscando um analista de dados para coletar, organizar e analisar grandes volumes de dados. O profissional será responsável por transformar dados em insights para apoiar decisões estratégicas.', 'São Paulo, SP', 'Presencial'),
(5, 'tech_innovators', '2025-01-20', 'Desenvolvedor Front-End', 'Procuramos desenvolvedor front-end com experiência em JavaScript, React e design responsivo. O candidato será responsável pela construção de interfaces de usuário inovadoras e funcionais.', 'São Paulo, SP', 'Presencial'),
(6, 'green_solutions', '2025-01-15', 'Especialista em Sustentabilidade', 'Buscamos um especialista em sustentabilidade para liderar projetos de ecoeficiência e gestão de resíduos. É necessário conhecimento em práticas ambientais e soluções ecológicas.', 'Rio de Janeiro, RJ', 'Híbrido'),
(7, 'green_solutions', '2025-01-18', 'Consultor de Energias Renováveis', 'Procuramos consultor especializado em energias renováveis para implementar projetos de energia solar e eólica para nossos clientes, promovendo soluções ecológicas e sustentáveis.', 'Rio de Janeiro, RJ', 'Híbrido'),
(8, 'healthcare_plus', '2025-01-20', 'Médico Clínico Geral', 'Estamos em busca de um médico clínico geral para trabalhar em nosso centro médico, oferecendo consultas e atendimentos a pacientes. Experiência prévia é desejada.', 'Porto Alegre, RS', 'Presencial'),
(9, 'healthcare_plus', '2025-01-22', 'Fisioterapeuta', 'Estamos contratando fisioterapeuta para atender nossos pacientes em tratamentos de recuperação e bem-estar. É necessário ter experiência na área de fisioterapia ortopédica.', 'Porto Alegre, RS', 'Presencial'),
(10, 'edu_future', '2025-01-25', 'Instrutor de Programação', 'Procuramos um instrutor de programação para desenvolver e ministrar cursos de ensino online em plataformas como Python, JavaScript e Inteligência Artificial.', 'Curitiba, PR', 'Remoto'),
(11, 'edu_future', '2025-01-28', 'Designer Instrucional', 'Procuramos designer instrucional para criar e desenvolver materiais didáticos interativos e envolventes para cursos online. Experiência em plataformas de e-learning é desejada.', 'Curitiba, PR', 'Remoto'),
(12, 'edu_future', '2025-02-01', 'Gerente de Projetos Educacionais', 'Buscamos gerente de projetos educacionais para coordenar e planejar a execução de programas de ensino online e aperfeiçoamento de plataformas. É necessário experiência em gestão de projetos.', 'Curitiba, PR', 'Remoto'),
(13, 'build_smart', '2025-02-03', 'Engenheiro Civil - Construção Sustentável', 'Buscamos engenheiro civil com experiência em construção sustentável e uso de tecnologias ecológicas. Responsável por projetos de edifícios verdes e eficientes.', 'Belo Horizonte, MG', 'Presencial'),
(14, 'build_smart', '2025-02-05', 'Arquiteto de Projetos Sustentáveis', 'Buscamos arquiteto com experiência em projetos sustentáveis e construção ecológica. O profissional será responsável por planejar e executar projetos de edifícios inteligentes e sustentáveis.', 'Belo Horizonte, MG', 'Presencial'),
(15, 'build_smart', '2025-02-07', 'Assistente de Obras', 'Estamos contratando assistente de obras para atuar no acompanhamento e apoio em projetos de construção sustentável. O profissional ajudará a garantir que os projetos atendam aos requisitos ecológicos.', 'Belo Horizonte, MG', 'Presencial');

-- Alterando a quantidade de candidatos por vaga entre 0 e 5
INSERT INTO APLICACAO_VAGA (id_perfil, id_vaga, estado, data_inscricao)
VALUES 
-- Vaga 1 (3 candidatos)
('john_doe', 1, 'Em análise', '2025-01-12'),
('jane_smith', 1, 'Aprovado', '2025-01-13'),
('lucas_santos', 1, 'Em análise', '2025-01-14'),

-- Vaga 2 (2 candidatos)
('john_doe', 2, 'Aprovado', '2025-01-13'),
('sofia_ferreira', 2, 'Em análise', '2025-01-15'),

-- Vaga 3 (1 candidato)
('jane_smith', 3, 'Em análise', '2025-01-14'),

-- Vaga 4 (4 candidatos)
('jane_smith', 4, 'Aprovado', '2025-01-14'),
('carla_mendes', 4, 'Em análise', '2025-01-15'),
('roberto_lima', 4, 'Aprovado', '2025-01-16'),

-- Vaga 5 (2 candidatos)
('lucas_santos', 5, 'Em análise', '2025-01-17'),
('sofia_ferreira', 5, 'Aprovado', '2025-01-18'),

-- Vaga 6 (3 candidatos)
('carla_mendes', 6, 'Em análise', '2025-01-20'),
('pedro_almeida', 6, 'Aprovado', '2025-01-21'),
('ana_clara', 6, 'Em análise', '2025-01-22'),

-- Vaga 7 (0 candidatos)

-- Vaga 8 (5 candidatos)
('roberto_lima', 8, 'Aprovado', '2025-01-22'),
('sofia_ferreira', 8, 'Em análise', '2025-01-23'),
('gustavo_pereira', 8, 'Aprovado', '2025-01-24'),
('pedro_almeida', 8, 'Aprovado', '2025-01-25'),
('carla_mendes', 8, 'Em análise', '2025-01-26'),

-- Vaga 9 (1 candidato)
('pedro_almeida', 9, 'Aprovado', '2025-01-26'),

-- Vaga 10 (4 candidatos)
('ana_clara', 10, 'Em análise', '2025-01-28'),
('roberto_lima', 10, 'Aprovado', '2025-01-29'),
('sofia_ferreira', 10, 'Em análise', '2025-01-30'),

-- Vaga 11 (3 candidatos)
('gustavo_pereira', 11, 'Em análise', '2025-01-30'),
('pedro_almeida', 11, 'Aprovado', '2025-01-31'),
('lucas_santos', 11, 'Em análise', '2025-02-01'),

-- Vaga 12 (2 candidatos)
('sofia_ferreira', 12, 'Aprovado', '2025-02-01'),
('roberto_lima', 12, 'Em análise', '2025-02-02'),

-- Vaga 13 (0 candidatos)

-- Vaga 14 (1 candidato)
('gustavo_pereira', 14, 'Em análise', '2025-02-04'),

-- Vaga 15 (3 candidatos)
('roberto_lima', 15, 'Aprovado', '2025-02-06'),
('ana_clara', 15, 'Em análise', '2025-02-07'),
('gustavo_pereira', 15, 'Aprovado', '2025-02-08');

-- Inscrições nos eventos
INSERT INTO INSCRICAO_EVENTO (id_perfil, id_evento)
VALUES 
-- Tech Innovators Conference 2025
('john_doe', 'tech_innovators_conference_2025'),
('jane_smith', 'tech_innovators_conference_2025'),
('lucas_santos', 'tech_innovators_conference_2025'),
('mariana_oliveira', 'tech_innovators_conference_2025'),
('carla_mendes', 'tech_innovators_conference_2025'),

-- Green Solutions Sustainability Day
('roberto_lima', 'green_solutions_sustainability_day'),
('sofia_ferreira', 'green_solutions_sustainability_day'),
('pedro_almeida', 'green_solutions_sustainability_day'),

-- Healthcare Plus Wellness Summit
('ana_clara', 'healthcare_plus_wellness_summit'),
('gustavo_pereira', 'healthcare_plus_wellness_summit'),

-- Edu Future Online Education Forum
('john_doe', 'edu_future_online_education_forum'),
('jane_smith', 'edu_future_online_education_forum'),
('lucas_santos', 'edu_future_online_education_forum'),
('sofia_ferreira', 'edu_future_online_education_forum'),

-- Build Smart Smart Building Expo
('carla_mendes', 'build_smart_smart_building_expo'),

-- Tech Innovators AI Workshop
('roberto_lima', 'tech_innovators_ai_workshop'),
('pedro_almeida', 'tech_innovators_ai_workshop'),

-- Green Solutions Ecology & Innovation
('sofia_ferreira', 'green_solutions_ecology_innovation'),
('gustavo_pereira', 'green_solutions_ecology_innovation'),

-- Healthcare Plus Virtual Health Fair
('ana_clara', 'healthcare_plus_virtual_health_fair'),
('gustavo_pereira', 'healthcare_plus_virtual_health_fair'),
('carla_mendes', 'healthcare_plus_virtual_health_fair'),

-- Edu Future: Tech in Education
('john_doe', 'edu_future_tech_in_education'),
('lucas_santos', 'edu_future_tech_in_education'),
('pedro_almeida', 'edu_future_tech_in_education'),

-- Build Smart: Sustainability in Construction
('roberto_lima', 'build_smart_sustainability_in_construction'),
('pedro_almeida', 'build_smart_sustainability_in_construction');

-- Experiências para as pessoas
INSERT INTO EXPERIENCIA (id_perfil_pessoal, id_perfil_companhia, titulo, data_inicio, data_fim, descricao)
VALUES
-- John Doe (3 experiências)
('john_doe', 'tech_innovators', 'Desenvolvedor de Software', '2022-06-01', '2023-12-31', 'Desenvolvimento de soluções de inteligência artificial para melhorar a experiência dos usuários.'),
('john_doe', 'green_solutions', 'Líder de Desenvolvimento de Software', '2024-01-01', NULL, 'Liderança de equipe de desenvolvedores para implementar inovações tecnológicas e otimizar processos de IA.'),
('john_doe', 'tech_innovators', 'Gerente de Engenharia', '2024-02-01', NULL, 'Gestão de equipe de engenheiros para inovação e desenvolvimento de novas soluções tecnológicas.'),

-- Jane Smith (2 experiências)
('jane_smith', 'green_solutions', 'Designer Gráfico', '2022-07-15', '2023-12-15', 'Criação de identidade visual para campanhas de sustentabilidade e projetos ecológicos.'),
('jane_smith', 'edu_future', 'Líder de Design', '2024-01-10', NULL, 'Coordenação das equipes de design e branding para desenvolver soluções visuais e estratégicas para projetos educacionais.'),

-- Lucas Santos (2 experiências)
('lucas_santos', 'healthcare_plus', 'Analista Financeiro', '2021-03-01', '2023-08-01', 'Gestão financeira e planejamento orçamentário para o centro médico focado em bem-estar.'),
('lucas_santos', 'tech_innovators', 'Gerente Financeiro', '2023-09-01', NULL, 'Responsável pela supervisão de todas as operações financeiras e orçamentárias da empresa de inovação tecnológica.'),

-- Mariana Oliveira (1 experiência)
('mariana_oliveira', 'healthcare_plus', 'Psicóloga', '2020-01-15', '2023-12-31', 'Atendimento psicológico para pacientes com foco em saúde mental e bem-estar integral.'),

-- Carla Mendes (4 experiências)
('carla_mendes', 'green_solutions', 'Engenheira Ambiental', '2021-06-01', '2023-11-30', 'Desenvolvimento de projetos sustentáveis e soluções ecológicas para empresas.'),
('carla_mendes', 'build_smart', 'Gerente de Sustentabilidade', '2023-12-01', NULL, 'Gestão de projetos ambientais e implementação de soluções sustentáveis no mercado de construção inteligente.'),
('carla_mendes', 'green_solutions', 'Analista Ambiental', '2021-01-01', '2021-06-01', 'Realização de pesquisas sobre soluções de baixo impacto ambiental para processos industriais.'),
('carla_mendes', 'build_smart', 'Consultora de Sustentabilidade', '2022-05-01', '2023-11-01', 'Consultoria para empresas do setor da construção na implementação de práticas sustentáveis.'),

-- Roberto Lima (3 experiências)
('roberto_lima', 'tech_innovators', 'Especialista em Marketing Digital', '2020-03-01', '2023-06-30', 'Estratégias de marketing digital para promover inovação tecnológica e produtos de ponta.'),
('roberto_lima', 'green_solutions', 'Coordenador de Marketing', '2023-07-01', NULL, 'Coordenação das campanhas de marketing para promover iniciativas ecológicas e soluções sustentáveis.'),
('roberto_lima', 'build_smart', 'Especialista em Marketing Digital', '2023-07-01', NULL, 'Desenvolvimento de campanhas de marketing focadas na construção inteligente e sustentável.'),

-- Sofia Ferreira (1 experiência)
('sofia_ferreira', 'healthcare_plus', 'Médica Veterinária', '2020-02-15', '2023-12-31', 'Atendimento e acompanhamento de animais com foco em bem-estar e saúde animal.'),

-- Pedro Almeida (2 experiências)
('pedro_almeida', 'edu_future', 'Professor de Matemática', '2018-08-01', '2021-12-01', 'Ministração de aulas de matemática para alunos de diversas faixas etárias, com foco em ensino a distância.'),
('pedro_almeida', 'green_solutions', 'Consultor Educacional', '2022-01-01', NULL, 'Consultoria para criação de cursos e materiais educativos focados em sustentabilidade e meio ambiente.'),

-- Ana Clara (2 experiências)
('ana_clara', 'build_smart', 'Chef de Cozinha', '2019-06-01', '2022-12-31', 'Preparação de pratos gourmet com ingredientes sustentáveis para eventos e empresas.'),
('ana_clara', 'edu_future', 'Consultora de Culinária', '2023-01-01', NULL, 'Consultoria para desenvolvimento de cursos de culinária vegana para plataformas educacionais.'),

-- Gustavo Pereira (2 experiências)
('gustavo_pereira', 'build_smart', 'Arquiteto', '2019-02-01', '2021-12-01', 'Desenvolvimento de projetos de arquitetura para construção sustentável e eficiente em termos de energia.'),
('gustavo_pereira', 'tech_innovators', 'Arquiteto de Soluções', '2022-01-01', NULL, 'Desenvolvimento de soluções arquitetônicas utilizando tecnologia de ponta e práticas sustentáveis.');

-- Inserir seguimentos entre perfis
INSERT INTO SEGUIMENTO (id_perfil, id_perfil_seguido, data_seguimento) VALUES
('john_doe', 'jane_smith', '2024-01-01'),
('john_doe', 'lucas_santos', '2024-01-02'),
('john_doe', 'roberto_lima', '2024-01-03'),
('john_doe', 'carla_mendes', '2024-01-04'),
('jane_smith', 'john_doe', '2024-01-05'),
('jane_smith', 'carla_mendes', '2024-01-06'),
('jane_smith', 'sofia_ferreira', '2024-01-07'),
('lucas_santos', 'mariana_oliveira', '2024-01-08'),
('lucas_santos', 'ana_clara', '2024-01-09'),
('mariana_oliveira', 'lucas_santos', '2024-01-10'),
('mariana_oliveira', 'pedro_almeida', '2024-01-11'),
('carla_mendes', 'roberto_lima', '2024-01-12'),
('carla_mendes', 'tech_innovators', '2024-01-13'),
('roberto_lima', 'build_smart', '2024-01-14'),
('sofia_ferreira', 'green_solutions', '2024-01-15'),
('sofia_ferreira', 'build_smart', '2024-01-16'),
('pedro_almeida', 'edu_future', '2024-01-17'),
('ana_clara', 'pedro_almeida', '2024-01-18'),
('gustavo_pereira', 'build_smart', '2024-01-19'),
('gustavo_pereira', 'tech_innovators', '2024-01-20'),
('tech_innovators', 'green_solutions', '2024-01-21'),
('green_solutions', 'tech_innovators', '2024-01-22'),
('healthcare_plus', 'build_smart', '2024-01-23'),
('build_smart', 'healthcare_plus', '2024-01-24'),
('edu_future', 'green_solutions', '2024-01-25'),
('edu_future', 'build_smart', '2024-01-26'),
('build_smart', 'edu_future', '2024-01-27');

-- Inserir idiomas e suas proficiências
INSERT INTO LISTA_IDIOMA (nome, proficiencia) VALUES
('Inglês', 'Básico'),
('Inglês', 'Intermediário'),
('Inglês', 'Avançado'),
('Inglês', 'Fluente'),
('Espanhol', 'Básico'),
('Espanhol', 'Intermediário'),
('Espanhol', 'Avançado'),
('Espanhol', 'Fluente'),
('Francês', 'Básico'),
('Francês', 'Intermediário'),
('Francês', 'Avançado'),
('Francês', 'Fluente'),
('Português', 'Básico'),
('Português', 'Intermediário'),
('Português', 'Avançado'),
('Português', 'Fluente');

-- Inserir perfis com seus respectivos idiomas e proficiências
INSERT INTO POSSUI_IDIOMA (id_perfil, nome, proficiencia) VALUES
('john_doe', 'Inglês', 'Fluente'),
('john_doe', 'Espanhol', 'Intermediário'),
('john_doe', 'Francês', 'Básico'),

('jane_smith', 'Inglês', 'Intermediário'),
('jane_smith', 'Francês', 'Básico'),

('lucas_santos', 'Espanhol', 'Fluente'),
('lucas_santos', 'Inglês', 'Intermediário'),
('lucas_santos', 'Português', 'Fluente'),

('mariana_oliveira', 'Português', 'Fluente'),
('mariana_oliveira', 'Inglês', 'Básico'),
('mariana_oliveira', 'Espanhol', 'Intermediário'),

('carla_mendes', 'Inglês', 'Intermediário'),

('roberto_lima', 'Inglês', 'Fluente'),
('roberto_lima', 'Espanhol', 'Intermediário'),

('sofia_ferreira', 'Português', 'Fluente'),
('sofia_ferreira', 'Inglês', 'Fluente'),

('pedro_almeida', 'Francês', 'Intermediário'),

('ana_clara', 'Inglês', 'Fluente'),
('ana_clara', 'Espanhol', 'Intermediário'),
('ana_clara', 'Francês', 'Básico'),

('gustavo_pereira', 'Francês', 'Fluente'),
('gustavo_pereira', 'Inglês', 'Fluente'),
('gustavo_pereira', 'Espanhol', 'Intermediário');

INSERT INTO LISTA_SETOR (id_setor, nome_setor) VALUES
(1, 'Tecnologia'),
(2, 'Ecológico'),
(3, 'Saúde'),
(4, 'Educação'),
(5, 'Construção'),
(6, 'Marketing'),
(7, 'Inovação'),
(8, 'Consultoria'),
(9, 'Sustentabilidade'),
(10, 'Arquitetura');

-- Associações de empresas com seus respectivos setores
INSERT INTO SETOR_COMPANHIA (id_setor, id_perfil) VALUES
(1, 'tech_innovators'), -- Tech Innovators no setor de Tecnologia
(7, 'tech_innovators'), -- Tech Innovators no setor de Inovação
(2, 'green_solutions'), -- Green Solutions no setor Ecológico
(9, 'green_solutions'), -- Green Solutions no setor de Sustentabilidade
(3, 'healthcare_plus'), -- Healthcare Plus no setor de Saúde
(8, 'healthcare_plus'), -- Healthcare Plus no setor de Consultoria
(4, 'edu_future'),      -- Edu Future no setor de Educação
(6, 'edu_future'),      -- Edu Future no setor de Marketing
(5, 'build_smart'),     -- Build Smart no setor de Construção
(10, 'build_smart'),    -- Build Smart no setor de Arquitetura
(9, 'build_smart'),     -- Build Smart no setor de Sustentabilidade
(7, 'build_smart');     -- Build Smart no setor de Inovação

-- Inserir competências para as vagas de 'Tech Innovators'
INSERT INTO COMPETENCIA (id_competencia, id_vaga, competencia) VALUES
(1, 1, 'Python'),
(2, 1, 'JavaScript'),
(3, 1, 'Aprendizado de máquina'),
(4, 2, 'IA aplicada'),
(5, 2, 'Soluções baseadas em aprendizado de máquina'),
(6, 3, 'Plataformas de nuvem'),
(7, 3, 'Trabalho em equipes ágeis'),
(8, 4, 'Análise de dados'),
(9, 4, 'Ferramentas de análise de dados'),
(10, 5, 'React'),
(11, 5, 'Design responsivo'),
(12, 6, 'Práticas ambientais'),
(13, 6, 'Gestão de resíduos'),
(14, 7, 'Energias renováveis'),
(15, 7, 'Projetos de energia solar e eólica'),
(16, 8, 'Médico clínico geral'),
(17, 8, 'Atendimento a pacientes'),
(18, 9, 'Fisioterapia ortopédica'),
(19, 9, 'Tratamentos de recuperação e bem-estar'),
(20, 10, 'Python'),
(21, 10, 'JavaScript'),
(22, 10, 'Inteligência Artificial'),
(23, 11, 'Design instrucional'),
(24, 11, 'Plataformas de e-learning'),
(25, 12, 'Gestão de projetos educacionais'),
(26, 12, 'Plataformas de ensino online'),
(27, 13, 'Construção sustentável'),
(28, 13, 'Tecnologias ecológicas'),
(29, 14, 'Projetos sustentáveis'),
(30, 14, 'Projetos de edifícios inteligentes'),
(31, 15, 'Apoio em projetos de construção sustentável'),
(32, 15, 'Requisitos ecológicos');


-- Inserindo curtidas nas publicações (1 a 10 curtidas por publicação)
INSERT INTO CURTIDA VALUES
('john_doe', 1, '2024-01-05'),
('lucas_santos', 1, '2024-01-06'),
('roberto_lima', 1, '2024-01-07'),
('sofia_ferreira', 2, '2024-01-08'),
('pedro_almeida', 2, '2024-01-09'),
('ana_clara', 2, '2024-01-10'),
('gustavo_pereira', 2, '2024-01-11'),
('tech_innovators', 3, '2024-01-12'),
('green_solutions', 3, '2024-01-13'),
('healthcare_plus', 3, '2024-01-14'),
('edu_future', 3, '2024-01-15'),
('build_smart', 3, '2024-01-16'),
('john_doe', 4, '2024-01-17'),
('jane_smith', 4, '2024-01-18'),
('carla_mendes', 4, '2024-01-19'),
('roberto_lima', 4, '2024-01-20'),
('sofia_ferreira', 4, '2024-01-21'),
('pedro_almeida', 5, '2024-01-22'),
('gustavo_pereira', 5, '2024-01-23'),
('ana_clara', 5, '2024-01-24'),
('tech_innovators', 5, '2024-01-25'),
('green_solutions', 6, '2024-01-26'),
('healthcare_plus', 6, '2024-01-27'),
('edu_future', 6, '2024-01-28'),
('build_smart', 6, '2024-01-29'),
('john_doe', 7, '2024-01-30'),
('jane_smith', 7, '2024-01-31'),
('lucas_santos', 7, '2024-02-01'),
('mariana_oliveira', 7, '2024-02-02'),
('carla_mendes', 7, '2024-02-03'),
('sofia_ferreira', 8, '2024-02-04'),
('pedro_almeida', 8, '2024-02-05'),
('gustavo_pereira', 8, '2024-02-06'),
('tech_innovators', 9, '2024-02-07'),
('green_solutions', 9, '2024-02-08'),
('healthcare_plus', 9, '2024-02-09'),
('edu_future', 9, '2024-02-10'),
('build_smart', 9, '2024-02-11'),
('john_doe', 10, '2024-02-12'),
('jane_smith', 10, '2024-02-13'),
('lucas_santos', 10, '2024-02-14'),
('mariana_oliveira', 10, '2024-02-15'),
('carla_mendes', 10, '2024-02-16'),
('roberto_lima', 10, '2024-02-17'),
('sofia_ferreira', 10, '2024-02-18'),
('pedro_almeida', 10, '2024-02-19'),
('gustavo_pereira', 10, '2024-02-20'),
('tech_innovators', 10, '2024-02-21'),
('green_solutions', 10, '2024-02-22'),
('healthcare_plus', 10, '2024-02-23'),
('edu_future', 10, '2024-02-24'),
('build_smart', 10, '2024-02-25'),
('john_doe', 11, '2024-02-26'),
('jane_smith', 11, '2024-02-27'),
('lucas_santos', 11, '2024-02-28'),
('mariana_oliveira', 11, '2024-03-01'),
('carla_mendes', 11, '2024-03-02'),
('sofia_ferreira', 12, '2024-03-03'),
('pedro_almeida', 12, '2024-03-04'),
('gustavo_pereira', 12, '2024-03-05'),
('tech_innovators', 12, '2024-03-06'),
('green_solutions', 12, '2024-03-07'),
('healthcare_plus', 13, '2024-03-08'),
('edu_future', 13, '2024-03-09'),
('build_smart', 13, '2024-03-10'),
('john_doe', 13, '2024-03-11'),
('jane_smith', 13, '2024-03-12'),
('lucas_santos', 14, '2024-03-13'),
('mariana_oliveira', 14, '2024-03-14'),
('carla_mendes', 14, '2024-03-15'),
('sofia_ferreira', 14, '2024-03-16'),
('pedro_almeida', 14, '2024-03-17'),
('gustavo_pereira', 15, '2024-03-18'),
('tech_innovators', 15, '2024-03-19'),
('green_solutions', 15, '2024-03-20'),
('healthcare_plus', 15, '2024-03-21'),
('edu_future', 16, '2024-03-22'),
('build_smart', 16, '2024-03-23'),
('john_doe', 16, '2024-03-24'),
('jane_smith', 16, '2024-03-25'),
('lucas_santos', 17, '2024-03-26'),
('mariana_oliveira', 17, '2024-03-27'),
('carla_mendes', 17, '2024-03-28'),
('sofia_ferreira', 17, '2024-03-29'),
('pedro_almeida', 18, '2024-03-30'),
('gustavo_pereira', 18, '2024-03-31'),
('tech_innovators', 18, '2024-04-01'),
('green_solutions', 18, '2024-04-02'),
('healthcare_plus', 19, '2024-04-03'),
('edu_future', 19, '2024-04-04'),
('build_smart', 19, '2024-04-05'),
('john_doe', 19, '2024-04-06'),
('jane_smith', 19, '2024-04-07'),
('lucas_santos', 20, '2024-04-08'),
('mariana_oliveira', 20, '2024-04-09'),
('carla_mendes', 20, '2024-04-10'),
('sofia_ferreira', 20, '2024-04-11'),
('pedro_almeida', 20, '2024-04-12'),
('john_doe', 21, '2024-04-13'),
('jane_smith', 21, '2024-04-14'),
('lucas_santos', 21, '2024-04-15'),
('mariana_oliveira', 21, '2024-04-16'),
('carla_mendes', 22, '2024-04-17'),
('sofia_ferreira', 22, '2024-04-18'),
('pedro_almeida', 22, '2024-04-19'),
('gustavo_pereira', 23, '2024-04-20'),
('tech_innovators', 23, '2024-04-21'),
('green_solutions', 23, '2024-04-22'),
('healthcare_plus', 23, '2024-04-23'),
('edu_future', 24, '2024-04-24'),
('build_smart', 24, '2024-04-25'),
('john_doe', 24, '2024-04-26'),
('jane_smith', 25, '2024-04-27'),
('lucas_santos', 25, '2024-04-28'),
('mariana_oliveira', 26, '2024-04-29'),
('carla_mendes', 26, '2024-04-30'),
('sofia_ferreira', 26, '2024-05-01'),
('pedro_almeida', 27, '2024-05-02'),
('gustavo_pereira', 27, '2024-05-03'),
('tech_innovators', 28, '2024-05-04'),
('green_solutions', 28, '2024-05-05'),
('healthcare_plus', 29, '2024-05-06'),
('edu_future', 30, '2024-05-07');

INSERT INTO LINKS VALUES 
    (1, 'tech_innovators_conference_2025', 'https://techinnovators.com/conference2025'),
    (2, 'tech_innovators_conference_2025', 'https://techinnovators.com/agenda2025'),
    (1, 'green_solutions_sustainability_day', 'https://greensolutions.com/sustainabilityday'),
    (2, 'green_solutions_sustainability_day', 'https://greensolutions.com/workshops'),
    (1, 'healthcare_plus_wellness_summit', 'https://healthcareplus.com/wellnesssummit'),
    (2, 'healthcare_plus_wellness_summit', 'https://healthcareplus.com/keynotes'),
    (1, 'edu_future_online_education_forum', 'https://edufuture.com/onlineforum'),
    (2, 'edu_future_online_education_forum', 'https://edufuture.com/speakers'),
    (1, 'build_smart_smart_building_expo', 'https://buildsmart.com/smartbuildingexpo'),
    (2, 'build_smart_smart_building_expo', 'https://buildsmart.com/innovations');

INSERT INTO FOTOS_PUBLICACAO VALUES 
    (1, 1, 'https://hlinkedin.com/photos/publicacao1.jpg'),
    (2, 2, 'https://hlinkedin.com/photos/publicacao2.jpg'),
    (3, 3, 'https://hlinkedin.com/photos/publicacao3.jpg'),
    (4, 4, 'https://hlinkedin.com/photos/publicacao4.jpg'),
    (5, 5, 'https://hlinkedin.com/photos/publicacao5.jpg'),
    (6, 6, 'https://hlinkedin.com/photos/publicacao6.jpg'),
    (7, 7, 'https://hlinkedin.com/photos/publicacao7.jpg'),
    (8, 8, 'https://hlinkedin.com/photos/publicacao8.jpg'),
    (9, 9, 'https://hlinkedin.com/photos/publicacao9.jpg'),
    (10, 10, 'https://hlinkedin.com/photos/publicacao10.jpg'),
    (11, 11, 'https://hlinkedin.com/photos/publicacao11.jpg'),
    (12, 12, 'https://hlinkedin.com/photos/publicacao12.jpg'),
    (13, 13, 'https://hlinkedin.com/photos/publicacao13.jpg'),
    (14, 14, 'https://hlinkedin.com/photos/publicacao14.jpg'),
    (15, 15, 'https://hlinkedin.com/photos/publicacao15.jpg'),
    (16, 16, 'https://hlinkedin.com/photos/publicacao16.jpg'),
    (17, 17, 'https://hlinkedin.com/photos/publicacao17.jpg'),
    (18, 18, 'https://hlinkedin.com/photos/publicacao18.jpg'),
    (19, 19, 'https://hlinkedin.com/photos/publicacao19.jpg'),
    (20, 20, 'https://hlinkedin.com/photos/publicacao20.jpg');