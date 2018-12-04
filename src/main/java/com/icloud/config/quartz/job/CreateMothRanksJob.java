/**
 * @author
 * @version
 * 2018年7月24日 下午4:45:16
 */
package com.icloud.config.quartz.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * 类名称: CreateMothRanksJob
 * 类描述: 生成月排行榜(铁杆粉，话题王，大人榜)
 * 创建人: zhangdehai
 * 创建时间:2018年7月24日 下午4:45:16
 */
@Component
@EnableScheduling
public class CreateMothRanksJob {

	public final static Logger log = LoggerFactory.getLogger(CreateMothRanksJob.class);


	
//	秒（0~59）
//	分钟（0~59）
//	小时（0~23）
//	天（月）（0~31，但是你需要考虑你月的天数）
//	月（0~11）
//	天（星期）（1~7 1=SUN 或 SUN，MON，TUE，WED，THU，FRI，SAT）
//	年份（1970－2099）

//	@Scheduled(cron = "0 0/2 * * * ?")
	//每月1号凌晨1点生成上一月的排行榜记录
//	@Scheduled(cron = "0 0 1 1 * ?")
	public void toCreateMothRanksJob() throws Exception{
		log.info("===============toCreateMothRanksJob running===============");


		log.info("===============toCreateMothRanksJob end ===============");
	}
}
