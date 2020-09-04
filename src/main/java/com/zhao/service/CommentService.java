package com.zhao.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhao.bean.Comment;
import com.zhao.dao.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;

	/**
	 * 按帖子id（fid）查询评论表信息
	 * @param fid
	 * @return
	 */
	public List<Comment> getCommentFid(int fid) {

		return commentMapper.selectByCommentFid(fid);
	}

	/**
	 * 按帖子id（fid）查询评论表信息
	 * @param fid
	 * @return
	 */
	public List<Comment> getCommentFidMap(int fid , Map<Object, Object> map) {
		List<Comment> listComment = commentMapper.selectByCommentFid(fid);
		map.put("listComment", listComment);
		return listComment;
	}

	/**
	 * 按用户id（userid）查询评论表的fid信息
	 * @param userid
	 * @return
	 */
	public List<Comment> getCommentUserid(int userid) {

		return commentMapper.selectByCommentUserid(userid);
	}

	/**
	 * 添加评论
	 * @param comment
	 */
	public void setComment(Comment comment) {

		commentMapper.insertSelective(comment);
	}

	/**
	 * 按pid删除评论表
	 * @param comment
	 */
	public void deleteComment(int pid) {

		commentMapper.deleteByPrimaryKey(pid);
	}

	/**
	 * 删除该用户对应的所有评论信息(按userid)
	 * @param userid
	 */
	public void deleteCommentUserid(int userid) {
		
		commentMapper.deleteByUserid(userid);
	}


	/**
	 * 按帖子id（fid）查询该条帖子的评论数
	 * @param fid
	 * @return
	 */
	public int getCountFid(int fid) {
		return commentMapper.selectByCountFid(fid);
	}
}
