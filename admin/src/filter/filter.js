/**
 * 数组过滤器 如：{{CHARGE | optionKV(section.charge)}}
 * @param list 如：[{key:"C", value:"收费"}, {key:"F", value:"免费"}]
 * @param key 如：C
 * @returns {string} 如：收费
 */
let optionKV = (list, key) => {
    if (!list || !key){
        return "";
    } else {
        let result = "";
        for (let i = 0; i < list.length; i++){
            if (key == list[i]["key"]){
                result = list[i]["value"];
            }
        }
        return result;
    }
};

export default {
    optionKV
}