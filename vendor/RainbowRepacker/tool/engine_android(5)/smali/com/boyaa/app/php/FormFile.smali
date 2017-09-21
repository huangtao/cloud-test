.class public Lcom/boyaa/app/php/FormFile;
.super Ljava/lang/Object;
.source "FormFile.java"


# instance fields
.field private contentType:Ljava/lang/String;

.field private data:[B

.field private fileName:Ljava/lang/String;

.field private formNames:Ljava/lang/String;

.field private inputStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "openInputStream"    # Ljava/io/InputStream;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "formNames"    # Ljava/lang/String;
    .param p4, "contentType"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, "application/octet-stream"

    iput-object v0, p0, Lcom/boyaa/app/php/FormFile;->contentType:Ljava/lang/String;

    .line 37
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->inputStream:Ljava/io/InputStream;

    .line 38
    iput-object p2, p0, Lcom/boyaa/app/php/FormFile;->fileName:Ljava/lang/String;

    .line 39
    iput-object p3, p0, Lcom/boyaa/app/php/FormFile;->formNames:Ljava/lang/String;

    .line 40
    iput-object p4, p0, Lcom/boyaa/app/php/FormFile;->contentType:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public constructor <init>([BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "formNames"    # Ljava/lang/String;
    .param p4, "contentType"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, "application/octet-stream"

    iput-object v0, p0, Lcom/boyaa/app/php/FormFile;->contentType:Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->data:[B

    .line 30
    iput-object p2, p0, Lcom/boyaa/app/php/FormFile;->fileName:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Lcom/boyaa/app/php/FormFile;->formNames:Ljava/lang/String;

    .line 32
    iput-object p4, p0, Lcom/boyaa/app/php/FormFile;->contentType:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/boyaa/app/php/FormFile;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getData()[B
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/boyaa/app/php/FormFile;->data:[B

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/boyaa/app/php/FormFile;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getFormNames()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/boyaa/app/php/FormFile;->formNames:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/boyaa/app/php/FormFile;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->contentType:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setData([B)V
    .locals 0
    .param p1, "data"    # [B

    .prologue
    .line 48
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->data:[B

    .line 49
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->fileName:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setFormNames(Ljava/lang/String;)V
    .locals 0
    .param p1, "formNames"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->formNames:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/boyaa/app/php/FormFile;->inputStream:Ljava/io/InputStream;

    .line 81
    return-void
.end method
