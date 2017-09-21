.class Lcom/boyaa/engine/made/AppGLSurfaceView$2;
.super Ljava/lang/Object;
.source "AppGLSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppGLSurfaceView;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppGLSurfaceView;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/boyaa/engine/made/AppGLSurfaceView$2;->this$0:Lcom/boyaa/engine/made/AppGLSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 132
    invoke-static {}, Lcom/boyaa/engine/made/GhostLib;->onResume()V

    .line 133
    return-void
.end method
