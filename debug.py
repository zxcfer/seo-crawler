from scrapy.cmdline import execute

def main():
    
    command = ['scrapy', 'crawl','seocrawler']
    execute(argv=command)
    #scrapy crawl bingsearch -a keyword=94 -a user_id=1 -a project_id=11

if  __name__ =='__main__':
    main()