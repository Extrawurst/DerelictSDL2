/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sdl2.sdl;

public:
version(Derelict_Static) version = DerelictSDL2_Static;
version(DerelictSDL2_Static)
      import derelict.sdl2.sdlstatic;
else
      import derelict.sdl2.sdldynload;


alias SDL_BlitSurface = SDL_UpperBlit;
alias SDL_BlitScaled = SDL_UpperBlitScaled;

@nogc nothrow {
    // SDL_audio.h
    SDL_AudioSpec* SDL_LoadWAV(const(char)* file,SDL_AudioSpec* spec,Uint8** audio_buf,Uint32* len) {
        return SDL_LoadWAV_RW(SDL_RWFromFile(file,"rb"),1,spec,audio_buf,len);
    }

    // SDL_events.h
    Uint8 SDL_GetEventState(Uint32 type) {
        return SDL_EventState(type,SDL_QUERY);
    }

    // SDL_GameController.h
    int SDL_GameControllerAddMappingsFromFile(const(char)* file) {
        return SDL_GameControllerAddMappingsFromRW(SDL_RWFromFile(file,"rb"),1);
    }

    // SDL_quit.h
    bool SDL_QuitRequested() {
        SDL_PumpEvents();
        return SDL_PeepEvents(null,0,SDL_PEEKEVENT,SDL_QUIT,SDL_QUIT) > 0;
    }

    // SDL_surface.h
    SDL_Surface* SDL_LoadBMP(const(char)* file) {
        return SDL_LoadBMP_RW(SDL_RWFromFile(file,"rb"),1);
    }

    int SDL_SaveBMP(SDL_Surface* surface,const(char)* file) {
        return SDL_SaveBMP_RW(surface,SDL_RWFromFile(file,"wb"),1);
    }
}