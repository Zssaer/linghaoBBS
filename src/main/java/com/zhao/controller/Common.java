package com.zhao.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zhao.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.zhao.bean.Article;
import com.zhao.bean.Attention;
import com.zhao.bean.Collect;
import com.zhao.bean.Comment;
import com.zhao.bean.Plate;

/**
 * 整合查询Contorler
 */
@RequestMapping("/common")
@SessionAttributes(value = { "plate", "sessionIp" })
@Controller
public class Common {

	@Autowired
	PlateController plateController;
	@Autowired
	UserController userController;
	@Autowired
	ArticleController articleController;
	@Autowired
	CommentController commentController;
	@Autowired
	CommentService commentService;
	@Autowired
	PlateService plateService;
	@Autowired
	AttentionService attentionService;
	@Autowired
	CollectService collectService;
	@Autowired
	VisitController visitController;
	@Autowired
	VisitService visitService;

	/**
	 * 查询输出首页全部信息（不包含head）
	 * 
	 * @return
	 */
	@RequestMapping("/getAll")
	@ResponseBody
	public Map getAll(Map<Object, Object> map2, HttpServletRequest request, HttpSession session) {

		Map<Object, Object> map = new HashMap<>();
        //查询帖子
		articleController.getArticle(map, 1, 10);
		//获取帖子列表
		List<Article> listArticle= (List<Article>) map.get("listArticle");
		//获取总帖子数
		int count = listArticle.size();

		for (int i = 0; i < count; i++) {

			// 将每一条帖子对应的id单独抽出来
			int fid = listArticle.get(i).getFid();
			// 再通过每一个帖子的id查找出对应的评论信息
			commentService.getCommentFidMap(fid, map);
			// 将上一步查出的对应的评论信息存放到listComment里
			List<Comment> listComment = (List<Comment>) map.get("listComment");

			// 为map预设一个随帖子id变化而变化的key
			String listCommentFid = "listComment_" + fid;
			// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
			map.put(listCommentFid, listComment);
		}
		//去除多余信息,这里查出来的评论列表没有id
		map.remove("listComment");

		// 查询板块信息（无条件）
		List<Plate> plate = plateService.getPlate();
		map.put("plate", plate);

		// 查询关注信息(无条件)
		List<Attention> attention = attentionService.getAttention();
		map.put("attention", attention);

		// 查询收藏信息（无条件）
		List<Collect> collect = collectService.getCollect();
		map.put("collect", collect);


		return map;
	}

	/**
	 * 追加更多的帖子信息（帖子+评论+关注+收藏）
	 *
	 * @return
	 */
	@RequestMapping("/appendMore")
	@ResponseBody
	public Map appendMore(@RequestParam(required=true,defaultValue="1") int pageStart, @RequestParam(required=true,defaultValue="10")int pageSize) {

		Map<Object, Object> map = new HashMap<>();
		articleController.getArticle(map, pageStart, pageSize);
		List<Article> listArticle = (List<Article>) map.get("listArticle");
		int count = listArticle.size();

		for (int i = 0; i < count; i++) {
			// 将每一条帖子对应的id单独抽出来
			int fid = listArticle.get(i).getFid();
			// 再通过每一个帖子的id查找出对应的评论信息
			commentService.getCommentFidMap(fid, map);
			// 将上一步查出的对应的评论信息存放到listComment里
			List<Comment> listComment = (List<Comment>) map.get("listComment");

			// 为map预设一个随帖子id变化而变化的key
			String listCommentFid = "listComment_" + fid;
			// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
			map.put(listCommentFid, listComment);
		}
		//去除多余信息
		map.remove("listComment");

		// 查询关注信息(无条件)
		List<Attention> attention = attentionService.getAttention();
		map.put("attention", attention);

		// 查询收藏信息（无条件）
		List<Collect> collect = collectService.getCollect();
		map.put("collect", collect);

		return map;
	}

	/**
	 * 查询输出-管理员-首页分页信息（不包含head）
	 * @return
	 */
	@RequestMapping("/getAll_Admin")
	@ResponseBody
	public Map getAll_Admin() {
		Map<Object, Object> map = new HashMap<>();

		// 查询板块信息（无条件）
		plateController.getPlate(map);
		// 查询用户信息（分页）
		userController.getUser(map,1,10);
		// 查询帖子信息（分页）
		articleController.getArticleAdmin(map, 1, 10);
		// 查询访问信息（分页）
		visitController.getVisit(map, 1, 15);

		return map;
	}

	/**
	 * 按帖子标题模糊查询（搜索框搜索）
	 * 
	 * @param request
	 * @param map
	 * @param map2
	 * @return
	 */
	@RequestMapping("/getArticleTitle/{articleTitle}")
	@ResponseBody
	public Map getArticleTitle(@PathVariable String articleTitle,HttpServletRequest request) {
		Map<Object, Object> map = new HashMap<>();
		//根据title查找帖子
		articleController.getArticleTitle(articleTitle, map);
		//返回符合要求的帖子
		List<Article> listArticle = (List<Article>) map.get("listArticle");

		int count = listArticle.size();
		System.out.println("符合条件的帖子数："+count);
		for (int i = 0; i < count; i++) {

			// 将每一条帖子对应的id单独抽出来
			int fid = listArticle.get(i).getFid();
			// 再通过每一个帖子的id查找出对应的评论信息
			commentService.getCommentFidMap(fid, map);
			// 将上一步查出的对应的评论信息存放到listComment里
			List<Comment> listComment = (List<Comment>) map.get("listComment");

			// 为map预设一个随帖子id变化而变化的key
			String listCommentFid = "listComment_" + fid;
			// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
			map.put(listCommentFid, listComment);


		}
		//去除多余信息
		map.remove("listComment");

		// 查询板块信息（无条件）
		List<Plate> plate = plateService.getPlate();
		map.put("plate", plate);

		// 查询关注信息(无条件)
		List<Attention> attention = attentionService.getAttention();
		map.put("attention", attention);

		// 查询收藏信息（无条件）
		List<Collect> collect = collectService.getCollect();
		map.put("collect", collect);

		return map;
	}

	/**
	 * 按帖子板块查询出帖子
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/getArticleBname/{bname}")
	@ResponseBody
	public Map getArticleBname(@PathVariable String bname, HttpServletRequest request) {
		Map<Object, Object> map = new HashMap<>();
		articleController.getArticleBname(bname, map);
		List<Article> listArticle = (List<Article>) map.get("listArticle");
		int count = listArticle.size();

		for (int i = 0; i < count; i++) {

			// 将每一条帖子对应的id单独抽出来
			int fid = listArticle.get(i).getFid();
			// 再通过每一个帖子的id查找出对应的评论信息
			commentService.getCommentFidMap(fid, map);
			// 将上一步查出的对应的评论信息存放到listComment里
			List<Comment> listComment = (List<Comment>) map.get("listComment");

			// 为map预设一个随帖子id变化而变化的key
			String listCommentFid = "listComment_" + fid;
			// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
			map.put(listCommentFid, listComment);
		}
		//去除多余信息
		map.remove("listComment");

		// 查询板块信息（无条件）
		List<Plate> plate = plateService.getPlate();
		map.put("plate", plate);

		// 查询关注信息(无条件)
		List<Attention> attention = attentionService.getAttention();
		map.put("attention", attention);

		// 查询收藏信息（无条件）
		List<Collect> collect = collectService.getCollect();
		map.put("collect", collect);

		return map;
	}

}
