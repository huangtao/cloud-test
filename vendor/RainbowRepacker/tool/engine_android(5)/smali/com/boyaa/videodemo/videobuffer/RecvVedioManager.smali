.class public Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;
.super Ljava/lang/Object;
.source "RecvVedioManager.java"


# static fields
.field private static mInstance:Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;


# instance fields
.field private bean:Lcom/boyaa/videodemo/bean/VedioFrameBean;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Lcom/boyaa/videodemo/bean/VedioFrameBean;

    invoke-direct {v0}, Lcom/boyaa/videodemo/bean/VedioFrameBean;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->bean:Lcom/boyaa/videodemo/bean/VedioFrameBean;

    .line 21
    return-void
.end method

.method public static getInstance()Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->mInstance:Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    invoke-direct {v0}, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;-><init>()V

    sput-object v0, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->mInstance:Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    .line 16
    :cond_0
    sget-object v0, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->mInstance:Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;

    return-object v0
.end method


# virtual methods
.method public getVedioFrame()Lcom/boyaa/videodemo/bean/VedioFrameBean;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/boyaa/videodemo/videobuffer/RecvVedioManager;->bean:Lcom/boyaa/videodemo/bean/VedioFrameBean;

    return-object v0
.end method
