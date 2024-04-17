insert into website (id, description, created_at, updated_at, name, url, status) values (1, 'Binacube', '2015-01-01 00:00:00', '2015-01-01 00:00:00', 'Binacube', 'http://www.binacube.com/', 1);
insert into website (id, description, created_at, updated_at, name, url, status) values (2, 'Welath Smart', '2015-01-01 00:00:00', '2015-01-01 00:00:00', 'Wealth Smart', 'http://www.wealthsmart.com.au', 1);
insert into website (id, description, created_at, updated_at, name, url, status) values (3, 'Spot Light', '2015-01-01 00:00:00', '2015-01-01 00:00:00', 'Sport Light', 'http://www.spotlight.com.au/', 1);

insert into alert (id, severety, description) values (101, 2, 'Title tag not found');
insert into alert (id, severety, description) values (102, 2, 'More than one title tag');
insert into alert (id, severety, description) values (103, 1, 'Title tag changed');
insert into alert (id, severety, description) values (104, 2, 'Title tag exists, but it is empty');
insert into alert (id, severety, description) values (201, 2, 'Meta tag Description not found');
insert into alert (id, severety, description) values (202, 3, 'More than one Meta tag Description');
insert into alert (id, severety, description) values (203, 2, 'Title changed');
insert into alert (id, severety, description) values (204, 1, 'Meta tag Description not found');
insert into alert (id, severety, description) values (301, 0, 'Meta tag Description not found');
insert into alert (id, severety, description) values (302, 0, 'More than one Meta tag Description');
insert into alert (id, severety, description) values (303, 1, 'Title changed');
insert into alert (id, severety, description) values (401, 3, 'No "alt" in image tags for {N} images');
insert into alert (id, severety, description) values (501, 2, 'Parameters detected in {N} links');

insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (53, 'http://www.binacube.com/', 0, '2015-04-30 03:09:37', '2015-04-30 03:09:37', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (54, 'http://www.binacube.com/', 0, '2015-04-30 03:09:37', '2015-04-30 03:09:37', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (55, 'http://www.binacube.com/?name=productos', 0, '2015-04-30 03:09:38', '2015-04-30 03:09:38', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (56, 'http://www.binacube.com/?name=contact', 0, '2015-04-30 03:09:38', '2015-04-30 03:09:38', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (57, 'http://www.binacube.com/?name=portafolio', 0, '2015-04-30 03:09:38', '2015-04-30 03:09:38', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (58, 'http://www.binacube.com/?name=project&number=7', 0, '2015-04-30 03:09:38', '2015-04-30 03:09:38', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (59, 'http://www.binacube.com/?name=project&number=8', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (60, 'http://www.binacube.com/?name=project&number=5', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (61, 'http://www.binacube.com/?name=project&number=6', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (62, 'http://www.binacube.com/?name=project&number=4', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (63, 'http://www.binacube.com/?name=project&number=3', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (64, 'http://www.binacube.com/?name=project&number=2', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (65, 'http://www.binacube.com/?name=project&number=1', 0, '2015-04-30 03:09:39', '2015-04-30 03:09:39', 1, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (66, 'http://spotlight.com.au/', 0, '2015-04-30 03:09:41', '2015-04-30 03:09:41', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (67, 'http://spotlight.com.au/', 0, '2015-04-30 03:09:43', '2015-04-30 03:09:43', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (68, 'http://spotlight.com.au/departments/fabrics-and-yarn/fabric-faq/', 0, '2015-04-30 03:09:45', '2015-04-30 03:09:45', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (69, 'http://spotlight.com.au/departments/fabrics-and-yarn/furnishing-fabrics/', 0, '2015-04-30 03:09:46', '2015-04-30 03:09:46', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (70, 'http://spotlight.com.au/departments/craft-hobbies/floral/', 0, '2015-04-30 03:09:47', '2015-04-30 03:09:47', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (71, 'http://spotlight.com.au/departments/craft-hobbies/craft-components/', 0, '2015-04-30 03:09:47', '2015-04-30 03:09:47', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (72, 'http://spotlight.com.au/departments/craft-hobbies/doll-bear-making/', 0, '2015-04-30 03:09:47', '2015-04-30 03:09:47', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (73, 'http://spotlight.com.au/departments/craft-hobbies/beading/', 0, '2015-04-30 03:09:48', '2015-04-30 03:09:48', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (74, 'http://spotlight.com.au/departments/craft-hobbies/craft-embellishments/', 0, '2015-04-30 03:09:48', '2015-04-30 03:09:48', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (75, 'http://www.wealthsmart.com.au', 0, '2015-04-30 03:09:48', '2015-04-30 03:09:48', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (76, 'http://spotlight.com.au/departments/fabrics-and-yarn/weave-fabrics/', 0, '2015-04-30 03:09:49', '2015-04-30 03:09:49', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (77, 'http://spotlight.com.au/departments/fabrics-and-yarn/boutique-fabrics/', 0, '2015-04-30 03:09:49', '2015-04-30 03:09:49', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (78, 'http://spotlight.com.au/departments/fabrics-and-yarn/yarn/', 0, '2015-04-30 03:09:49', '2015-04-30 03:09:49', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (79, 'http://spotlight.com.au/departments/fabrics-and-yarn/embroidery/', 0, '2015-04-30 03:09:50', '2015-04-30 03:09:50', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (80, 'http://spotlight.com.au/departments/fabrics-and-yarn/quilting-fabrics/', 0, '2015-04-30 03:09:50', '2015-04-30 03:09:50', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (81, 'http://spotlight.com.au/departments/fabrics-and-yarn/fashion-fabrics/', 0, '2015-04-30 03:09:50', '2015-04-30 03:09:50', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (82, 'http://spotlight.com.au/departments/craft-hobbies/general-crafts/', 0, '2015-04-30 03:09:51', '2015-04-30 03:09:51', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (83, 'http://www.wealthsmart.com.au/privacy-policy/', 0, '2015-04-30 03:09:51', '2015-04-30 03:09:51', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (84, 'http://spotlight.com.au/departments/fabrics-and-yarn/knit-fabrics/', 0, '2015-04-30 03:09:51', '2015-04-30 03:09:51', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (85, 'http://spotlight.com.au/departments/craft-hobbies/kids-craft/', 0, '2015-04-30 03:09:52', '2015-04-30 03:09:52', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (86, 'http://www.wealthsmart.com.au/needs-analysis/', 0, '2015-04-30 03:09:56', '2015-04-30 03:09:56', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (87, 'http://www.wealthsmart.com.au/terms-conditions/', 0, '2015-04-30 03:09:57', '2015-04-30 03:09:57', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (88, 'http://www.wealthsmart.com.au/product-disclosure-statements/', 0, '2015-04-30 03:09:58', '2015-04-30 03:09:58', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (89, 'http://www.wealthsmart.com.au/general-advice-statement/', 0, '2015-04-30 03:09:58', '2015-04-30 03:09:58', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (90, 'http://www.wealthsmart.com.au/contact/', 0, '2015-04-30 03:10:00', '2015-04-30 03:10:00', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (91, 'http://www.wealthsmart.com.au/about/who-we-are/', 0, '2015-04-30 03:10:03', '2015-04-30 03:10:03', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (92, 'http://www.wealthsmart.com.au/about/client-testimonials/', 0, '2015-04-30 03:10:03', '2015-04-30 03:10:03', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (93, 'http://www.wealthsmart.com.au/life-insurance-comparison/ages-60-plus/', 0, '2015-04-30 03:10:05', '2015-04-30 03:10:05', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (94, 'http://www.wealthsmart.com.au/life-insurance-comparison/ages-30-40/', 0, '2015-04-30 03:10:05', '2015-04-30 03:10:05', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (95, 'http://www.wealthsmart.com.au/insurance-partners/', 0, '2015-04-30 03:10:09', '2015-04-30 03:10:09', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (96, 'http://www.wealthsmart.com.au/income/compare-policies/', 0, '2015-04-30 03:10:13', '2015-04-30 03:10:13', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (97, 'http://www.wealthsmart.com.au/life/tpd-insurance/', 0, '2015-04-30 03:10:13', '2015-04-30 03:10:13', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (98, 'http://www.wealthsmart.com.au/quotes/', 0, '2015-04-30 03:10:14', '2015-04-30 03:10:14', 2, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (99, 'http://spotlight.com.au/departments/craft-hobbies/art-supplies/', 0, '2015-04-30 03:10:14', '2015-04-30 03:10:14', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (100, 'http://spotlight.com.au/departments/craft-hobbies/paper-craft/', 0, '2015-04-30 03:10:15', '2015-04-30 03:10:15', 3, '2015-04-29');
insert into url (id, url, type, created_at, updated_at, website_id, reported_on) values (101, 'http://www.wealthsmart.com.au/2014/07/best-income-protection-policies-australia/', 0, '2015-04-30 03:10:15', '2015-04-30 03:10:15', 2, '2015-04-29');

insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (45, 'Binary Cube Software: Web', null, '|', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:37', '2015-04-30 03:09:37', 53);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (46, 'Binary Cube Software: Web', null, '|', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:37', '2015-04-30 03:09:37', 54);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (47, 'Binary Cube Software: Web', null, 'Nuestros Planes de Diseño de Páginas Web', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 55);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (48, 'Binary Cube Software: Web', null, null, null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 56);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (49, 'Binary Cube Software: Web', null, 'Nuestros mejores proyectos!', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 57);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (50, 'Binary Cube Software: Web', null, 'Administrador de Intranet', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 58);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (51, 'Binary Cube Software: Web', null, 'SWC Hot Prospects', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 59);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (52, 'Binary Cube Software: Web', null, null, null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 60);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (53, 'Binary Cube Software: Web', null, 'Sazen Suite', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 61);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (54, 'Binary Cube Software: Web', null, null, null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 62);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (55, 'Binary Cube Software: Web', null, 'QBillion', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 63);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (56, 'Binary Cube Software: Web', null, 'Garage Fairy', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 64);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (57, 'Binary Cube Software: Web', null, 'The German Quiz Website', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 65);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (58, 'Spotlight
    
        Australia', null, null, null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:41', '2015-04-30 03:09:41', 66);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (59, 'Spotlight
    
        Australia', null, null, null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:43', '2015-04-30 03:09:43', 67);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (60, 'Fabric FAQ - Spotlight
                
                    Australia', null, 'Fabric FAQ', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:45', '2015-04-30 03:09:45', 68);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (61, 'Furnishing Fabrics - Spotlight
                
                    Australia', null, 'Furnishing Fabrics', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:46', '2015-04-30 03:09:46', 69);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (62, 'Floral - Spotlight
                
                    Australia', null, 'Floral', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 70);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (63, 'Craft Components - Spotlight
                
                    Australia', null, 'Craft Components', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 71);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (64, 'Doll & Bear Making - Spotlight
                
                    Australia', null, 'Doll & Bear Making', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 72);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (65, 'Beading - Spotlight
                
                    Australia', null, 'Beading', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:48', '2015-04-30 03:09:48', 73);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (66, 'Craft Embellishments - Spotlight
                
                    Australia', null, 'Craft Embellishments', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:48', '2015-04-30 03:09:48', 74);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (67, 'Life Insurance & Income Protection Insurance | Wealth Smart Australia', null, 'How Wealth Smart are you?|Free eBook: Life Insurance: 6 Questions to determine how much life insurance you need.', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:48', '2015-04-30 03:09:48', 75);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (68, 'Weave Fabrics - Spotlight
                
                    Australia', null, 'Weave Fabrics', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:49', '2015-04-30 03:09:49', 76);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (69, 'Boutique Fabrics - Spotlight
                
                    Australia', null, 'Boutique Fabrics', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:49', '2015-04-30 03:09:49', 77);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (70, 'Yarn - Spotlight
                
                    Australia', null, 'Yarn', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:49', '2015-04-30 03:09:49', 78);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (71, 'Embroidery - Spotlight
                
                    Australia', null, 'Embroidery', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:50', '2015-04-30 03:09:50', 79);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (72, 'Quilting Fabrics - Spotlight
                
                    Australia', null, 'Quilting Fabrics', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:50', '2015-04-30 03:09:50', 80);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (73, 'Fashion Fabrics - Spotlight
                
                    Australia', null, 'Fashion Fabrics', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:50', '2015-04-30 03:09:50', 81);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (74, 'General Crafts - Spotlight
                
                    Australia', null, 'General Crafts', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:51', '2015-04-30 03:09:51', 82);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (75, 'Privacy Policy Term & Conditions', null, 'Privacy Policy', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:51', '2015-04-30 03:09:51', 83);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (76, 'Knit Fabrics - Spotlight
                
                    Australia', null, 'Knit Fabrics', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:51', '2015-04-30 03:09:51', 84);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (77, 'Kids Craft - Spotlight
                
                    Australia', null, 'Kids Craft', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:52', '2015-04-30 03:09:52', 85);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (78, 'Life Insurance Needs Analysis Tool', null, 'Needs Analysis', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:56', '2015-04-30 03:09:56', 86);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (79, 'Terms & Conditions - Terms of Use', null, 'Terms & Conditions', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:57', '2015-04-30 03:09:57', 87);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (80, 'Product Disclosure Statement', null, 'Product Disclosure Statements', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:58', '2015-04-30 03:09:58', 88);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (81, 'General Advice Statement', null, 'General Advice Statement from Wealthsmart', null, null, null, null, null, '2015-04-29', '2015-04-30 03:09:58', '2015-04-30 03:09:58', 89);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (82, 'Contact Us | Wealth Smart Australia', null, 'Contact', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:00', '2015-04-30 03:10:00', 90);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (83, 'Who We Are | Wealth Smart Australia', null, 'Who Are We – Wealth Smart', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:03', '2015-04-30 03:10:03', 91);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (84, 'Client Testimonials | Wealth Smart Australia', null, 'Client Testimonials', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:03', '2015-04-30 03:10:03', 92);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (85, 'Life Insurance over 60 | Wealth Smart Australia', null, 'Life Insurance over 60', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:05', '2015-04-30 03:10:05', 93);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (86, 'Life Insurance for 30-40 year olds | Wealth Smart Australia', null, 'Life Insurance for 30 to 40 Year Olds', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:05', '2015-04-30 03:10:05', 94);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (87, 'Insurance Partners | Wealth Smart Australia', null, 'Our Insurance Partners', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:10', '2015-04-30 03:10:10', 95);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (88, 'Compare Income Protection Insurance - Wealth Smart', null, 'Compare Income Protection Insurance Policies', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:13', '2015-04-30 03:10:13', 96);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (89, 'TPD Insurance - Compare Quotes Online', null, 'TPD Insurance', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:13', '2015-04-30 03:10:13', 97);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (90, 'Life Insurance & Income Protection Quotes Online', null, 'Get a Quote', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:14', '2015-04-30 03:10:14', 98);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (91, 'Art Supplies - Spotlight
                
                    Australia', null, 'Art Supplies', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:14', '2015-04-30 03:10:14', 99);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (92, 'Paper Craft - Spotlight
                
                    Australia', null, 'Paper Craft', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:15', '2015-04-30 03:10:15', 100);
insert into url_status (id, title, description, h1, h2, h3, h4, h5, h6, reported_on, created_at, updated_at, url_id) values (93, 'The 7 Key Features of Income Protection Policies in Australia', null, 'The Best Income Protection Policies in Australia|7 Key Features of Income Protection', null, null, null, null, null, '2015-04-29', '2015-04-30 03:10:15', '2015-04-30 03:10:15', 101);

insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (4, '2015-04-29', '2015-04-30 03:09:37', '2015-04-30 03:09:37', 53, 202);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (5, '2015-04-29', '2015-04-30 03:09:37', '2015-04-30 03:09:37', 54, 202);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (6, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 55, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (7, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 56, 201);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (8, '2015-04-29', '2015-04-30 03:09:38', '2015-04-30 03:09:38', 57, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (9, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 58, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (10, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 59, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (11, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 60, 201);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (12, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 61, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (13, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 62, 201);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (14, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 63, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (15, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 64, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (16, '2015-04-29', '2015-04-30 03:09:39', '2015-04-30 03:09:39', 65, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (17, '2015-04-29', '2015-04-30 03:09:42', '2015-04-30 03:09:42', 66, 201);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (18, '2015-04-29', '2015-04-30 03:09:43', '2015-04-30 03:09:43', 67, 201);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (19, '2015-04-29', '2015-04-30 03:09:45', '2015-04-30 03:09:45', 68, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (20, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 69, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (21, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 70, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (22, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 71, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (23, '2015-04-29', '2015-04-30 03:09:47', '2015-04-30 03:09:47', 72, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (24, '2015-04-29', '2015-04-30 03:09:48', '2015-04-30 03:09:48', 73, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (25, '2015-04-29', '2015-04-30 03:09:48', '2015-04-30 03:09:48', 74, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (26, '2015-04-29', '2015-04-30 03:09:48', '2015-04-30 03:09:48', 75, 202);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (27, '2015-04-29', '2015-04-30 03:09:49', '2015-04-30 03:09:49', 76, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (28, '2015-04-29', '2015-04-30 03:09:49', '2015-04-30 03:09:49', 77, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (29, '2015-04-29', '2015-04-30 03:09:49', '2015-04-30 03:09:49', 78, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (30, '2015-04-29', '2015-04-30 03:09:50', '2015-04-30 03:09:50', 79, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (31, '2015-04-29', '2015-04-30 03:09:50', '2015-04-30 03:09:50', 80, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (32, '2015-04-29', '2015-04-30 03:09:50', '2015-04-30 03:09:50', 81, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (33, '2015-04-29', '2015-04-30 03:09:51', '2015-04-30 03:09:51', 82, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (34, '2015-04-29', '2015-04-30 03:09:51', '2015-04-30 03:09:51', 83, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (35, '2015-04-29', '2015-04-30 03:09:51', '2015-04-30 03:09:51', 84, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (36, '2015-04-29', '2015-04-30 03:09:52', '2015-04-30 03:09:52', 85, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (37, '2015-04-29', '2015-04-30 03:09:56', '2015-04-30 03:09:56', 86, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (38, '2015-04-29', '2015-04-30 03:09:57', '2015-04-30 03:09:57', 87, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (39, '2015-04-29', '2015-04-30 03:09:58', '2015-04-30 03:09:58', 88, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (40, '2015-04-29', '2015-04-30 03:09:58', '2015-04-30 03:09:58', 89, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (41, '2015-04-29', '2015-04-30 03:10:00', '2015-04-30 03:10:00', 90, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (42, '2015-04-29', '2015-04-30 03:10:03', '2015-04-30 03:10:03', 91, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (43, '2015-04-29', '2015-04-30 03:10:03', '2015-04-30 03:10:03', 92, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (44, '2015-04-29', '2015-04-30 03:10:05', '2015-04-30 03:10:05', 93, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (45, '2015-04-29', '2015-04-30 03:10:05', '2015-04-30 03:10:05', 94, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (46, '2015-04-29', '2015-04-30 03:10:10', '2015-04-30 03:10:10', 95, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (47, '2015-04-29', '2015-04-30 03:10:13', '2015-04-30 03:10:13', 96, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (48, '2015-04-29', '2015-04-30 03:10:13', '2015-04-30 03:10:13', 97, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (49, '2015-04-29', '2015-04-30 03:10:14', '2015-04-30 03:10:14', 98, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (50, '2015-04-29', '2015-04-30 03:10:15', '2015-04-30 03:10:15', 99, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (51, '2015-04-29', '2015-04-30 03:10:15', '2015-04-30 03:10:15', 100, 204);
insert into url_alert (id, reported_on, created_at, updated_at, url_id, alert_id) values (52, '2015-04-29', '2015-04-30 03:10:15', '2015-04-30 03:10:15', 101, 202);
