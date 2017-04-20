/**
 * author:JM
 * time:2017-04-19 11:07
 */

/**
 * 数据交互模块，基于axios
 *
 */

const axiosHttp={
	methods:{
		httpGet(url, data) {
      return new Promise((resolve, reject) => {
        axios.get(url, data).then((response) => {
          resolve(response.data)
        }, (response) => {
          reject(response)
          _g.closeGlobalLoading()
          bus.$message({
            message: '请求超时，请检查网络',
            type: 'warning'
          })
        })
      })
    },
		httpPost(url,data){
			return new Promise((resolve,reject)=>{
				axios.post(url,data).then((response)=>{
					resolve(response)
				},(response)=>{
					reject(response)
					// VueObj.$message({
					// 	message:'请求超时，请检查网络',
					// 	type:'warning'
					// })
				})
			})
		}
	}
}
export default axiosHttp