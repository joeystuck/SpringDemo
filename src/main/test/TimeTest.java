import org.springframework.test.context.TestExecutionListeners;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeTest {

    public static void main(String[] args) throws ParseException{

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String now = df.format(new Date());// new Date()为获取当前系统时间
        Date date = df.parse(now);
        System.out.println(date);
    }
}
