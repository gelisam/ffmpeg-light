{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Codec.FFmpeg.Enums where
import Data.Bits (Bits)
import Foreign.C.Types
import Foreign.Storable (Storable)

#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libavutil/avutil.h>
#include <libavutil/pixfmt.h>
#include <libavutil/mathematics.h>
#include <libswscale/swscale.h>
#include "nameCompat.h"

newtype AVMediaType = AVMediaType CInt deriving (Eq, Storable)
#enum AVMediaType,AVMediaType \
 , AVMEDIA_TYPE_VIDEO\
 , AVMEDIA_TYPE_AUDIO\
 , AVMEDIA_TYPE_DATA\
 , AVMEDIA_TYPE_SUBTITLE\
 , AVMEDIA_TYPE_ATTACHMENT\
 , AVMEDIA_TYPE_NB

newtype AVPixelFormat = AVPixelFormat CInt deriving (Eq, Storable)
#enum AVPixelFormat,AVPixelFormat \
 , AV_PIX_FMT_NONE\
 , AV_PIX_FMT_RGB24\
 , AV_PIX_FMT_RGBA\
 , AV_PIX_FMT_BGRA\
 , AV_PIX_FMT_Y400A\
 , AV_PIX_FMT_RGB32\
 , AV_PIX_FMT_RGB32_1\
 , AV_PIX_FMT_BGR32\
 , AV_PIX_FMT_BGR32_1\
 , AV_PIX_FMT_RGB8\
 , AV_PIX_FMT_BGR8\
 , AV_PIX_FMT_RGB4_BYTE\
 , AV_PIX_FMT_BGR4_BYTE\
 , AV_PIX_FMT_GRAY8\
 , AV_PIX_FMT_GRAY16\
 , AV_PIX_FMT_GRAY8A\
 , AV_PIX_FMT_PAL8\
 , AV_PIX_FMT_RGB565\
 , AV_PIX_FMT_RGB555\
 , AV_PIX_FMT_YUV420P\
 , AV_PIX_FMT_YUV420P9\
 , AV_PIX_FMT_YUV420P10\
 , AV_PIX_FMT_YUV420P12\
 , AV_PIX_FMT_YUV422P12\
 , AV_PIX_FMT_YUV444P12\
 , AV_PIX_FMT_YUV420P14\
 , AV_PIX_FMT_YUV422P14\
 , AV_PIX_FMT_YUV444P14\
 , AV_PIX_FMT_YUV420P16\
 , AV_PIX_FMT_YUV422P16\
 , AV_PIX_FMT_YUV444P16\
 , AV_PIX_FMT_RGBA64\
 , AV_PIX_FMT_BGRA64

instance Show AVPixelFormat where
  show x
    | x == avPixFmtRgb24 = "AV_PIX_FMT_RGB24"
    | x == avPixFmtYuv420p = "AV_PIX_FMT_Y420P"
    | x == avPixFmtYuv422p12 = "AV_PIX_FMTYUV422P12"
    | x == avPixFmtYuv420p14 = "AV_PIX_FMTYUV422P12"
    | otherwise = let AVPixelFormat y = x
                  in "Other pixel format: "++show y

newtype AVCodecID = AVCodecID CInt deriving (Eq, Show, Storable)
#enum AVCodecID,AVCodecID \
 , AV_CODEC_ID_H264\
 , AV_CODEC_ID_HEVC\
 , AV_CODEC_ID_THEORA\
 , AV_CODEC_ID_VC1\
 , AV_CODEC_ID_MPEG4\
 , AV_CODEC_ID_MPEG2VIDEO\
 , AV_CODEC_ID_RAWVIDEO\
 , AV_CODEC_ID_GIF\
 , AV_CODEC_ID_AAC\
 , AV_CODEC_ID_MP3\
 , AV_CODEC_ID_DTS

newtype SwsAlgorithm = SwsAlgorithm CUInt deriving (Eq, Show, Storable)
#enum SwsAlgorithm,SwsAlgorithm \
 , SWS_FAST_BILINEAR\
 , SWS_BILINEAR\
 , SWS_BICUBIC\
 , SWS_X\
 , SWS_POINT\
 , SWS_AREA\
 , SWS_BICUBLIN\
 , SWS_GAUSS\
 , SWS_SINC\
 , SWS_LANCZOS\
 , SWS_SPLINE

newtype FFProfile = FFProfile CInt deriving (Eq, Storable)
#enum FFProfile, FFProfile \
 , FF_PROFILE_AAC_MAIN\
 , FF_PROFILE_AAC_LOW\
 , FF_PROFILE_AAC_SSR\
 , FF_PROFILE_AAC_LTP\
 , FF_PROFILE_AAC_HE\
 , FF_PROFILE_AAC_HE_V2\
 , FF_PROFILE_AAC_LD\
 , FF_PROFILE_AAC_ELD\
 , FF_PROFILE_MPEG2_AAC_LOW\
 , FF_PROFILE_MPEG2_AAC_HE\
 , FF_PROFILE_DTS\
 , FF_PROFILE_DTS_ES\
 , FF_PROFILE_DTS_96_24\
 , FF_PROFILE_DTS_HD_HRA\
 , FF_PROFILE_DTS_HD_MA\
 , FF_PROFILE_MPEG2_422\
 , FF_PROFILE_MPEG2_HIGH\
 , FF_PROFILE_MPEG2_SS\
 , FF_PROFILE_MPEG2_SNR_SCALABLE\
 , FF_PROFILE_MPEG2_MAIN\
 , FF_PROFILE_MPEG2_SIMPLE\
 , FF_PROFILE_H264_CONSTRAINED\
 , FF_PROFILE_H264_INTRA\
 , FF_PROFILE_H264_BASELINE\
 , FF_PROFILE_H264_CONSTRAINED_BASELINE\
 , FF_PROFILE_H264_MAIN\
 , FF_PROFILE_H264_EXTENDED\
 , FF_PROFILE_H264_HIGH\
 , FF_PROFILE_H264_HIGH_10\
 , FF_PROFILE_H264_HIGH_10_INTRA\
 , FF_PROFILE_H264_HIGH_422\
 , FF_PROFILE_H264_HIGH_422_INTRA\
 , FF_PROFILE_H264_HIGH_444\
 , FF_PROFILE_H264_HIGH_444_PREDICTIVE\
 , FF_PROFILE_H264_HIGH_444_INTRA\
 , FF_PROFILE_H264_CAVLC_444\
 , FF_PROFILE_VC1_SIMPLE\
 , FF_PROFILE_VC1_MAIN\
 , FF_PROFILE_VC1_COMPLEX\
 , FF_PROFILE_VC1_ADVANCED\
 , FF_PROFILE_MPEG4_SIMPLE\
 , FF_PROFILE_MPEG4_SIMPLE_SCALABLE\
 , FF_PROFILE_MPEG4_CORE\
 , FF_PROFILE_MPEG4_MAIN\
 , FF_PROFILE_MPEG4_N_BIT\
 , FF_PROFILE_MPEG4_SCALABLE_TEXTURE\
 , FF_PROFILE_MPEG4_SIMPLE_FACE_ANIMATION\
 , FF_PROFILE_MPEG4_BASIC_ANIMATED_TEXTURE\
 , FF_PROFILE_MPEG4_HYBRID\
 , FF_PROFILE_MPEG4_ADVANCED_REAL_TIME\
 , FF_PROFILE_MPEG4_CORE_SCALABLE\
 , FF_PROFILE_MPEG4_ADVANCED_CODING\
 , FF_PROFILE_MPEG4_ADVANCED_CORE\
 , FF_PROFILE_MPEG4_ADVANCED_SCALABLE_TEXTURE\
 , FF_PROFILE_MPEG4_SIMPLE_STUDIO\
 , FF_PROFILE_MPEG4_ADVANCED_SIMPLE

newtype AVIOFlag = AVIOFlag CInt deriving (Eq, Storable)
#enum AVIOFlag, AVIOFlag \
 , AVIO_FLAG_READ\
 , AVIO_FLAG_WRITE\
 , AVIO_FLAG_READ_WRITE\
 , AVIO_FLAG_NONBLOCK\
 , AVIO_FLAG_DIRECT

newtype AVRoundMode = AVRoundMode CInt deriving (Eq, Storable)
#enum AVRoundMode, AVRoundMode \
 , AV_ROUND_ZERO\
 , AV_ROUND_INF\
 , AV_ROUND_DOWN\
 , AV_ROUND_UP\
 , AV_ROUND_NEAR_INF\
 , AV_ROUND_PASS_MINMAX

newtype CodecFlag = CodecFlag CInt deriving (Eq, Bits, Storable)
#enum CodecFlag, CodecFlag \
 , CODEC_FLAG_UNALIGNED\
 , CODEC_FLAG_QSCALE\
 , CODEC_FLAG_4MV\
 , CODEC_FLAG_OUTPUT_CORRUPT\
 , CODEC_FLAG_QPEL\
 , CODEC_FLAG_GMC\
 , CODEC_FLAG_MV0\
 , CODEC_FLAG_INPUT_PRESERVED\
 , CODEC_FLAG_PASS1\
 , CODEC_FLAG_PASS2\
 , CODEC_FLAG_GRAY\
 , CODEC_FLAG_EMU_EDGE\
 , CODEC_FLAG_PSNR\
 , CODEC_FLAG_TRUNCATED\
 , CODEC_FLAG_NORMALIZE_AQP\
 , CODEC_FLAG_INTERLACED_DCT\
 , CODEC_FLAG_LOW_DELAY\
 , CODEC_FLAG_GLOBAL_HEADER\
 , CODEC_FLAG_BITEXACT\
 , CODEC_FLAG_AC_PRED\
 , CODEC_FLAG_LOOP_FILTER\
 , CODEC_FLAG_INTERLACED_ME\
 , CODEC_FLAG_CLOSED_GOP

newtype FormatFlag = FormatFlag CInt deriving (Eq, Bits, Storable)
#enum FormatFlag, FormatFlag \
 , AVFMT_NOFILE\
 , AVFMT_NEEDNUMBER\
 , AVFMT_RAWPICTURE\
 , AVFMT_GLOBALHEADER\
 , AVFMT_NOTIMESTAMPS\
 , AVFMT_VARIABLE_FPS\
 , AVFMT_NODIMENSIONS\
 , AVFMT_NOSTREAMS\
 , AVFMT_ALLOW_FLUSH\
 , AVFMT_TS_NONSTRICT

newtype PacketFlag = PacketFlag CInt deriving (Eq, Bits, Storable)
#enum PacketFlag, PacketFlag \
 , AV_PKT_FLAG_KEY\
 , AV_PKT_FLAG_CORRUPT

newtype LogLevel = LogLevel CInt deriving (Eq, Bits, Storable)
#enum LogLevel, LogLevel \
 , AV_LOG_QUIET\
 , AV_LOG_PANIC\
 , AV_LOG_FATAL\
 , AV_LOG_ERROR\
 , AV_LOG_WARNING\
 , AV_LOG_INFO\
 , AV_LOG_VERBOSE\
 , AV_LOG_DEBUG\
 , AV_LOG_TRACE\
 , AV_LOG_MAX_OFFSET
