.class public interface abstract Lcom/boyaa/downloader/util/DownloadRunnable$IDownloadResponse;
.super Ljava/lang/Object;
.source "DownloadRunnable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/downloader/util/DownloadRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IDownloadResponse"
.end annotation


# static fields
.field public static final RESULT_CANCEL:I = 0x2

.field public static final RESULT_FAILED:I = 0x3

.field public static final RESULT_SUCCESS:I = 0x1


# virtual methods
.method public abstract onDownloadProgress(Ljava/lang/String;I)V
.end method

.method public abstract onDownloadResult(Ljava/lang/String;I)V
.end method
